import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyIconAndTitle extends StatelessWidget {

  final String icon ;
  final String title ;

  const MyIconAndTitle({
    super.key,
    required this.icon,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          height: 20,
        ),
        SizedBox(width: 5,),
        Text(
          title,
          style: TextStyle(
            color:  Color(0xFF3B3B3B),
            fontSize: 12,
            fontWeight: FontWeight.w400
          ),
        )
      ],
    );
  }
}
