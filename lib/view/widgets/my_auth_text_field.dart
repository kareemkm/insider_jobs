import 'package:flutter/material.dart';

class MyAuthTextField extends StatefulWidget {

  final TextEditingController input ;
  final Icon icon ;
  final String hintText ;
  final TextInputType inputType ;
  final bool isRead ;

  const MyAuthTextField({
    super.key,
    required this.input,
    required this.icon,
    required this.hintText,
    required this.inputType,
    required this.isRead
  });

  @override
  State<MyAuthTextField> createState() => _MyAuthTextFieldState();
}

class _MyAuthTextFieldState extends State<MyAuthTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        color: Colors.transparent,
         border: Border.all(color: Color(0xFFD3D3D3),width: 1,),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: TextField(
          controller: widget.input,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Color(0xFFD3D3D3),
              fontSize: 14,
              fontWeight: FontWeight.w500
            ),
            prefixIcon: widget.icon,
            border: InputBorder.none,
            focusedBorder: InputBorder.none
          ),
          keyboardType: widget.inputType,
          obscureText: widget.isRead,
          cursorColor: Colors.black,
        ),
      ),
    );
  }
}
