import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insider_jobs/view/screens/auth/login_screen.dart';
import '../../../data/network/auth_service.dart';
import '../../widgets/my_auth_text_field.dart';
import '../../widgets/my_blue_button.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();


  XFile? _image;
  String? _imageName ;
  bool isFind = false ;

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if(image != null){
      setState(() {
        _image = image ;
        _imageName = image.path.split('/').last;
        isFind = true ;
      });
    }
  }



  final auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
              color: Color(0xFF007AFF)
          ),
          child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80, left: 20),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top:10),
                    child: Text(
                      "Welcome to App",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  Expanded(
                      child: Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50))
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 30,),
                              MyAuthTextField(
                                  input: name,
                                  icon: Icon(Icons.person,color: Color(0xFFD3D3D3)),
                                  hintText: "Name",
                                  inputType: TextInputType.text,
                                  isRead: false
                              ),
                              SizedBox(height: 30,),
                              MyAuthTextField(
                                input: email,
                                icon: Icon(Icons.email_outlined,color: Color(0xFFD3D3D3),),
                                hintText: "Email",
                                inputType: TextInputType.emailAddress,
                                isRead: false,
                              ),
                              SizedBox(height: 30,),
                              MyAuthTextField(
                                  input: password,
                                  icon: Icon(Icons.lock,color: Color(0xFFD3D3D3),),
                                  hintText: "Password",
                                  inputType: TextInputType.visiblePassword,
                                  isRead: true
                              ),
                              SizedBox(height: 30,),
                              MyAuthTextField(
                                  input: confirmPassword,
                                  icon: Icon(Icons.lock,color: Color(0xFFD3D3D3),),
                                  hintText: "Confirm Password",
                                  inputType: TextInputType.visiblePassword,
                                  isRead: true
                              ),
                              SizedBox(height: 30,),
                              GestureDetector(
                                onTap: (){
                                  if(isFind){
                                    setState(() {
                                      _image = null ;
                                      _imageName = null ;
                                      isFind = false ;
                                    });
                                  }else{
                                    pickImage() ;
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: double.maxFinite,
                                  margin: EdgeInsets.symmetric(horizontal: 40),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(color: Color(0xFFD3D3D3),width: 1,),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: Row(
                                      children: [
                                        Icon(
                                          isFind ? Icons.delete : Icons.file_upload_outlined,
                                          color: Colors.black.withOpacity(0.3),
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          isFind ? _imageName! : "Upload image"  ,
                                          style: TextStyle(
                                            color: isFind ? Colors.black : Colors.black.withOpacity(0.2),
                                            fontWeight: FontWeight.w500
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 50,),
                              GestureDetector(
                                onTap: () async {
                                  if(password.text == confirmPassword.text){
                                    try{
                                      final result = await auth.signUp(name.text,email.text, password.text,_image);
                                      if(result['success']){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => LoginScreen())
                                        );
                                      }else{
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Field Input")));

                                      }
                                    }catch(e){
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("SignUp is Field $e")));

                                    }
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("the Password and Confirm password not same")));
                                  }
                                },
                                child: MyBlueButton(
                                  title: "Sign up",
                                ),
                              ),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "already have an account?  ",
                                    style: TextStyle(
                                        color: Color(0xFF7A7A7A),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Color(0xFF007AFF),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 40,)
                            ],
                          ),
                        ),
                      )
                  )
                ],
              )
          ),
        )
    );
  }
}
