import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insider_jobs/view/screens/auth/login_screen.dart';
import 'package:insider_jobs/view/screens/auth/sign_up_screen.dart';
import 'package:insider_jobs/view/widgets/my_wight_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: SvgPicture.asset(
                  "assets/images/logo_and_name.svg",
                  height: 60,
                  width: double.maxFinite,
        
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 70),
                  child: Text(
                    "Over 10,000+ jobs to apply",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20
                    ),
                  )
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20,right: 20,left: 20),
                  child: Text(
                    "Your Next Big Career Move Starts Right Here - Explore the Best Job Opportunities and Take the First Step Toward Your Future!",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 12
                    ),
                    textAlign: TextAlign.center,
                  )
              ),
              SizedBox(height: 50,),
              Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF0260FF),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                            },
                            child: MyWightButton(title: "Login",)
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: GestureDetector(
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));},
                              child: MyWightButton(title: "Sign Up",),
                          ),
                        )
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
