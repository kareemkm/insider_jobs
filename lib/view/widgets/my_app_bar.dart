import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{

  final String title ;
  final Color? color;

  const MyAppBar({
    super.key,
    required this.title,
    this.color
  });

@override
Size get preferredSize =>const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color ?? Color(0xFF0260FF),
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}
