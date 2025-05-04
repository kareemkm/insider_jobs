import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:insider_jobs/utils/check_auth_home.dart';
import 'package:insider_jobs/view/animation/slide_widget.dart';
import 'package:insider_jobs/view/screens/auth/intro_screen.dart';
import 'package:insider_jobs/view/screens/home/home_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {

  bool isFind = false;

  Future<void> isFindVoid() async{
    isFind =  (await getIsLogin())!;

  }

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(milliseconds:2500 ),(){
      isFindVoid();

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context)=> isFind ? HomeScreen() : IntroScreen()
          )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SlideWidget(
                begin: Offset(0, -20),
                end: Offset(0, 0),
                child: Text(
                    "Career",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                  ),
                )
            ),
            SlideWidget(
                begin: Offset(0, 20),
                end: Offset(0, 0),
                child: Text(
                    "Hub",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                )
            ),
          ],
        )
      )
    );
  }
}

