import 'package:flutter/material.dart';

class MyBlueButton extends StatelessWidget {

  final String title ;

  const MyBlueButton({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        color: Color(0xFF007AFF),
        borderRadius: BorderRadius.circular(50)
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500
          ),
        ),
      ),
    );
  }
}
