import 'package:flutter/material.dart';
import 'package:insider_jobs/view/screens/add_jobs/confirm_add_job_screen.dart';
import 'package:insider_jobs/view/widgets/my_add_job_text.dart';
import 'package:insider_jobs/view/widgets/my_app_bar.dart';
import 'package:insider_jobs/view/widgets/my_drawer.dart';

import '../../../data/network/add_job_service.dart';

class AddJobsScreen extends StatefulWidget {
  const AddJobsScreen({super.key});

  @override
  State<AddJobsScreen> createState() => _AddJobsScreenState();
}

class _AddJobsScreenState extends State<AddJobsScreen> {

  final TextEditingController jobTitle = TextEditingController();
  final TextEditingController jobDescription = TextEditingController();
  final TextEditingController jobSalary = TextEditingController();
  final TextEditingController jobLocation = TextEditingController();
  String? jobCategory ;
  String? jobLevel;

  final addJob = AddJobService();

  final List<String> jobLevels = [
    'Beginner level','intermediate level','senior level'
  ];

  final List<String> jobCategories = [
    'Programming','Marketing','Designing'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(title: "Add Jobs"),
      drawer: MyDrawer(),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  MyAddJobText(text: "Job Title"),
                  SizedBox(height: 10,),
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
                          controller: jobTitle,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type here",
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
                  MyAddJobText(text: "Job Description"),
                  SizedBox(height: 10,),
                  Container(
                    height: 200,
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
                        controller: jobDescription,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type here",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyAddJobText(text: "Job Category"),
                          SizedBox(height: 10,),
                          Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.6),
                                  width: 1
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    hint: Text(
                                      'Category',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.2),
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                    dropdownColor: Colors.white,
                                      isExpanded: true,
                                      value: jobCategory,
                                      icon: Icon(
                                        Icons.arrow_drop_down_outlined,
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                      items: jobCategories.map((item){
                                        return DropdownMenuItem(
                                          value: item,
                                          child: Text(
                                              item,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (newValue){
                                        setState(() {
                                          jobCategory = newValue ;
                                        });
                                      }
                                  )
                              )
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyAddJobText(text: "Job Location"),
                          SizedBox(height: 10,),
                          Container(
                            height: 50,
                            width: 150,
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
                                  controller: jobLocation,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "City",
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.2)
                                      )
                                  ),
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.name,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyAddJobText(text: "Job Level"),
                          SizedBox(height: 10,),
                          Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.6),
                                  width: 1
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      hint: Text(
                                        'level',
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(0.2),
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                        dropdownColor: Colors.white,
                                        isExpanded: true,
                                        value: jobLevel,
                                        icon: Icon(
                                          Icons.arrow_drop_down_outlined,
                                          color: Colors.black.withOpacity(0.6),
                                        ),
                                        items: jobLevels.map((item){
                                          return DropdownMenuItem(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (newValue){
                                          setState(() {
                                            jobLevel = newValue ;
                                          });
                                        }
                                    )
                                )
                            ),
                          )

                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyAddJobText(text: "Salary"),
                          SizedBox(height: 10,),
                          Container(
                            height: 50,
                            width: 150,
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
                                  controller: jobSalary,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "0",
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
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 40,),
                  GestureDetector(
                    onTap: () async {
                      try {
                        final result = await addJob.addJob(
                            jobTitle.text,
                            jobDescription.text,
                            jobLocation.text,
                            jobCategory!,
                            jobLevel!,
                            int.parse(jobSalary.text)
                        );
                        if(result['success']){
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => ConfirmAddJobScreen())
                          );
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Add job not success")));

                        }
                      }catch(e){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Add job is filed")));

                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                        child: Text(
                          'ADD',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),
          )
      ),
    );
  }
}
