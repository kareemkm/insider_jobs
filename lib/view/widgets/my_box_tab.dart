import 'package:flutter/material.dart';

class MyBoxTab extends StatelessWidget {

  final String title ;
  final Color color ;
  const MyBoxTab({
    super.key,
    required this.title,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        border: Border.all(color: color,width: 1),
        borderRadius: BorderRadius.circular(7)
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Color(0xFF8F8F8F),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
