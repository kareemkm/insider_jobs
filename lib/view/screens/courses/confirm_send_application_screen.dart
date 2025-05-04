import 'package:flutter/material.dart';
import 'package:insider_jobs/view/screens/courses/courses_screen.dart';

import '../../widgets/my_blue_button.dart';
import '../../widgets/my_main_button.dart';

class ConfirmSendApplicationScreen extends StatelessWidget {
  const ConfirmSendApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 10,),
            Icon(
              Icons.check_circle,
              color: Colors.purple,
              size: 200,
            ),
            Text(
              "Your Application has been sent !\nGood luck finding the right candidate",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.6)
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: MyMainButton(
                  title: "Back to Courses Home",
                  color: Colors.purple,
                  borderColor: Colors.purple,
                  titleColor: Colors.white,
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => CoursesScreen()),(Route<dynamic> route) => false
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
