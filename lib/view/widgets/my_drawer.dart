import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insider_jobs/utils/check_auth_home.dart';
import 'package:insider_jobs/view/screens/ai_caht/ai_assistant.dart';
import 'package:insider_jobs/view/screens/auth/intro_screen.dart';
import 'package:insider_jobs/view/screens/courses/courses_screen.dart';
import 'package:insider_jobs/view/screens/home/home_screen.dart';
import 'package:insider_jobs/view/screens/manage_jobs/manage_jobs_screen.dart';
import 'package:insider_jobs/view/screens/view_applications/view_applications_screen.dart';
import 'package:insider_jobs/view/widgets/my_item_in_drawer.dart';

import '../animation/slide_widget.dart';
import '../screens/add_jobs/add_jobs_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
        ),
        child: Column(
          children: [
            SizedBox(height: 70,),
            SizedBox(
              height: 120,
              width: double.infinity,
              child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SlideWidget(
                          begin: Offset(-10, 0),
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
                          begin: Offset(10, 0),
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
              ),
            ),
            SizedBox(height: 30,),
            Divider(color: Colors.black),
            SizedBox(height: 50,),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: MyItemInDrawer(
                  title: "Home",
                icon: "assets/images/home_icon.svg",
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ManageJobsScreen()));
              },
              child: MyItemInDrawer(
                title: "Manage Jobs",
                icon: "assets/images/suitcase_icon.svg",
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddJobsScreen()));
              },
              child: MyItemInDrawer(
                title: "Add Job",
                icon: "assets/images/add_icon.svg",
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ViewApplicationsScreen()));

              },
              child: MyItemInDrawer(
                title: "View Applications",
                icon: "assets/images/person_icon.svg",
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AiAssistant()));

              },
              child: MyItemInDrawer(
                title: "Ai Assistant",
                icon: "assets/images/chat_ai.svg",
                color: Color.lerp(Color(0xFFF35AA0), Color(0xFF9C27B0), 0.5),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CoursesScreen()));

              },
              child: MyItemInDrawer(
                title: "Courses",
                icon: "assets/images/courses.svg",
                color: Color.lerp(Color(0xFFF35AA0), Color(0xFF9C27B0), 0.5),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: GestureDetector(
                onTap: (){
                  // Logout
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.grey,
                      size: 25,
                    ),
                    SizedBox(width: 5,),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => IntroScreen()),(Route<dynamic> route) => false
                        );
                        saveIsLogin(false);
                      },
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 16
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
