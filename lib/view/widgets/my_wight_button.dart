import 'package:flutter/material.dart';

class MyWightButton extends StatelessWidget {
  final String title ;

  const MyWightButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100)
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Color(0xFF0260FF),
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),
        ),
      ),
    );
  }
}
