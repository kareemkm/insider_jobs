import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyItemInDrawer extends StatelessWidget {
  final String title ;
  final String icon ;
  final Color? color ;
  const MyItemInDrawer({
    super.key,
    required this.title,
    required this.icon,
    this.color
  });

  @override
  Widget build(BuildContext context) {

    Color backgroundColors = Colors.white ;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColors
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30,bottom: 40),
        child: Row(
          children: [
            SvgPicture.asset(
                icon,
              height: 25,
              color: color != null ? Color.lerp(Color(0xFFF35AA0), Color(0xFF9C27B0), 0.5): Colors.black,
            ),
            SizedBox(width: 20,),
            Text(
              title,
              style: TextStyle(
                color: color ?? Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400
              ),
            ),
            Spacer(),
            color != null ? SvgPicture.asset(
              "assets/images/sparkles.svg",
              color: Color.lerp(Color(0xFFF35AA0), Color(0xFF9C27B0), 0.5),
            ) : SizedBox(),
            SizedBox(width: 20,)
          ],
        ),
      ),
    );
  }
}

