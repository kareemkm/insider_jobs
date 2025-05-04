
import 'package:flutter/material.dart';

class MyMainButton extends StatelessWidget {

  final String title ;
  final Color color ;
  final Color borderColor ;
  final Color titleColor ;
  final VoidCallback onTap ;

  const MyMainButton({
    super.key,
    required this.title,
    required this.color,
    required this.borderColor,
    required this.titleColor,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor , width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: titleColor,
              fontSize: 15,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
      ),
    );
  }
}
