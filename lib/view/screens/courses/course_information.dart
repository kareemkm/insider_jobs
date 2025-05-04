import 'package:flutter/material.dart';
import 'package:insider_jobs/utils/get.dart';
import 'package:insider_jobs/view/screens/courses/course_application_screen.dart';
import 'package:insider_jobs/view/widgets/course_information_item.dart';
import 'package:insider_jobs/view/widgets/my_main_button.dart';

class CourseInformation extends StatefulWidget {

  final course ;

  const CourseInformation({super.key,required this.course});

  @override
  State<CourseInformation> createState() => _CourseInformationState();
}

class _CourseInformationState extends State<CourseInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Stack(
                children: [
                  Image.network(
                    widget.course['imageUrl'],
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: EdgeInsets.only(top: 40,left: 20),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                getLevelText(widget.course['level']),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              )
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.course['title'],
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                widget.course['description'],
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    '${widget.course['instructor']}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    '${widget.course['duration']}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                '\$${widget.course['price']}',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(child: Divider()),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MyMainButton(
                  title: "Course Application",
                  color: Colors.purple,
                  borderColor: Colors.purple,
                  titleColor: Colors.white,
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CourseApplicationScreen())
                    );
                  }
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(child: Divider()),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
                padding: EdgeInsets.only(left: 20),
              child: Text(
                "Course Curriculum",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
            ),

            SizedBox(height: 10,),
            CourseInformationItem(
                title: "Introduction To HTML5",
                isRequire: false
            ),
            CourseInformationItem(
                title: "CSS3 Stying and Layouts",
                isRequire: false
            ),
            CourseInformationItem(
                title: "JavaScript Fundament",
                isRequire: false
            ),
            CourseInformationItem(
                title: "Responsive Web Design",
                isRequire: false
            ),
            CourseInformationItem(
                title: "Basic DOM Manipulation",
                isRequire: false
            ),
            CourseInformationItem(
                title: "Forms and Validation",
                isRequire: false
            ),
            CourseInformationItem(
                title: "Introduction To Bootstrap",
                isRequire: false
            ),
            CourseInformationItem(
                title: "Final Project",
                isRequire: false
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Requirements",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
            ),
            SizedBox(height: 10,),
            CourseInformationItem(
                title: "Basic Computer Knowledge",
                isRequire: true
            ),
            CourseInformationItem(
                title: "No prior Programing experience needed",
                isRequire: true
            ),
            CourseInformationItem(
                title: "A Computer internet access",
                isRequire: true
            ),
            CourseInformationItem(
                title: "Eagerness to learn",
                isRequire: true
            ),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
