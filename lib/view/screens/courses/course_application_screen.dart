import 'package:flutter/material.dart';
import 'package:insider_jobs/view/screens/courses/confirm_send_application_screen.dart';
import 'package:insider_jobs/view/widgets/my_add_job_text.dart';
import 'package:insider_jobs/view/widgets/my_app_bar.dart';
import 'package:insider_jobs/view/widgets/my_main_button.dart';

class CourseApplicationScreen extends StatefulWidget {
  const CourseApplicationScreen({super.key});

  @override
  State<CourseApplicationScreen> createState() => _CourseApplicationScreenState();
}

class _CourseApplicationScreenState extends State<CourseApplicationScreen> {

  final TextEditingController fullName = TextEditingController() ;
  final TextEditingController email = TextEditingController() ;
  final TextEditingController phone = TextEditingController() ;
  final TextEditingController educationBackground = TextEditingController() ;
  final TextEditingController relevantExperience = TextEditingController() ;
  final TextEditingController whyTakeCourse = TextEditingController() ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(title: "Course Application",color: Colors.purple,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              MyAddJobText(text: "Fill Name"),
              SizedBox(height: 5,),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black.withOpacity(0.6),
                      width: 1
                  ),
                  borderRadius: BorderRadius.circular(10),

                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Center(
                    child: TextField(
                      controller: fullName,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "",
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.2)
                          )
                      ),
                      cursorColor: Colors.black,
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              MyAddJobText(text: "Email"),
              SizedBox(height: 5,),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black.withOpacity(0.6),
                      width: 1
                  ),
                  borderRadius: BorderRadius.circular(10),

                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Center(
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "",
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.2)
                          )
                      ),
                      cursorColor: Colors.black,
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              MyAddJobText(text: "Phone"),
              SizedBox(height: 5,),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black.withOpacity(0.6),
                      width: 1
                  ),
                  borderRadius: BorderRadius.circular(10),

                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Center(
                    child: TextField(
                      controller: phone,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "",
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.2)
                          )
                      ),
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              MyAddJobText(text: "Education Background"),
              SizedBox(height: 10,),
              Container(
                height: 120,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: TextField(
                    controller: educationBackground,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "",
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.2)
                        )
                    ),
                    cursorColor: Colors.black,
                    maxLines: 55,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              MyAddJobText(text: "Relevant Experience"),
              SizedBox(height: 10,),
              Container(
                height: 120,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: TextField(
                    controller: relevantExperience,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "",
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.2)
                        )
                    ),
                    cursorColor: Colors.black,
                    maxLines: 55,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              MyAddJobText(text: "Why do you want to take this course"),
              SizedBox(height: 10,),
              Container(
                height: 120,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: TextField(
                    controller: whyTakeCourse,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "",
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.2)
                        )
                    ),
                    cursorColor: Colors.black,
                    maxLines: 55,
                  ),
                ),
              ),
              SizedBox(height: 40,),
              MyMainButton(
                  title: "Send Element",
                  color: Colors.purple,
                  borderColor: Colors.purple,
                  titleColor: Colors.white,
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => ConfirmSendApplicationScreen())
                    );
                  }
              ),
              SizedBox(height: 40,)
            ],
          ),
        ),
      ),
    );
  }
}
