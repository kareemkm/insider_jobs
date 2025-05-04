import 'package:flutter/material.dart';
import 'package:insider_jobs/utils/check_auth_home.dart';
import 'package:insider_jobs/view/screens/auth/sign_up_screen.dart';
import 'package:insider_jobs/view/screens/home/home_screen.dart';
import 'package:insider_jobs/view/widgets/my_auth_text_field.dart';
import 'package:insider_jobs/view/widgets/my_blue_button.dart';

import '../../../data/network/auth_service.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

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
                  padding: const EdgeInsets.only(top: 120, left: 20),
                  child: Text(
                    "Login",
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
                    "Welcome back",
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
                            SizedBox(height: 50,),
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
                                hintText: "password",
                                inputType: TextInputType.visiblePassword,
                                isRead: true
                            ),
                            SizedBox(height: 20,),
                            Container(
                              width: double.maxFinite,
                              margin: EdgeInsets.only(left: 40),
                              child: Text(
                                  "Forgot password?",
                                style: TextStyle(
                                  color: Color(0xFF007AFF)
                                ),
                              ),
                            ),
                            SizedBox(height: 50,),
                            GestureDetector(
                              onTap: () async {
                                try {
                                  final result = await auth.login(email.text, password.text);
                                  if(result['success']){
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => HomeScreen()),(Route<dynamic> route) => false
                                    );
                                    saveIsLogin(true);
                                  }else {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("password or email not correct")));

                                  }
                                }catch(e){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login is Filed")));

                                }


                              },
                              child: MyBlueButton(
                                title: "Login",
                              ),
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don’t have an account?  ",
                                  style: TextStyle(
                                    color: Color(0xFF7A7A7A),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                                  },
                                  child: Text(
                                    "Signup",
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
