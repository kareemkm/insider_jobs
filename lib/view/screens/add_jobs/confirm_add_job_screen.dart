import 'package:flutter/material.dart';
import 'package:insider_jobs/view/widgets/my_blue_button.dart';

import '../home/home_screen.dart';

class ConfirmAddJobScreen extends StatelessWidget {
  const ConfirmAddJobScreen({super.key});

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
              color: Color(0xFF007AFF),
              size: 200,
            ),
            Text(
              "Your job has been posted!\nGood luck finding the right candidate",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black.withOpacity(0.6)
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),(Route<dynamic> route) => false
                );
              },
              child: MyBlueButton(title: "Back to Home"),
            )
          ],
        ),
      ),
    );
  }
}
