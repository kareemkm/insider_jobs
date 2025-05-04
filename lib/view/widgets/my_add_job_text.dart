
import 'package:flutter/material.dart';


class MyAddJobText extends StatelessWidget {

  final String text ;
  const MyAddJobText({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black.withOpacity(0.6),
        fontWeight: FontWeight.w500,
        fontSize: 16
      ),
    );
  }
}
