import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseInformationItem extends StatelessWidget {

  final String title ;
  final bool isRequire ;

  const CourseInformationItem({
    super.key,
    required this.title,
    required this.isRequire
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,bottom: 10),
      child: Row(
        children: [
          Icon(
            isRequire  ? Icons.error_outline : Icons.check_circle_outline_outlined,
            color: isRequire ? Colors.blue : Colors.green,
          ),
          SizedBox(width: 10,),
          Text(
            title,
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 14,
              fontWeight: FontWeight.w400
            ),
          )
        ],
      ),
    );
  }
}
