import 'package:flutter/material.dart';
import 'package:insider_jobs/view/widgets/my_icon_and_title.dart';
import 'package:insider_jobs/view/widgets/my_main_button.dart';

import '../../../data/model/job.dart';
class JobInformationScreen extends StatelessWidget {

  final Job job ;

  const JobInformationScreen({super.key,required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFF0260FF).withOpacity(0.1),
                    border: Border(bottom: BorderSide(color: Color(0xFF0260FF),width: 1.5)),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 70,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.network(
                            job.companyId.image,
                            height: 80,
                          ),
                          SizedBox(width: 20,),
                          Text(
                            job.title,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w600
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20 ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyIconAndTitle(
                              icon: 'assets/images/location_icon.svg',
                              title: job.location
                          ),
                          MyIconAndTitle(
                              icon: 'assets/images/person_icon.svg',
                              title: job.level
                          ),
                          MyIconAndTitle(
                              icon: 'assets/images/money_icon.svg',
                              title: " CTC${job.salary}k"
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 40,)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Job description",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  job.description,
                  style: TextStyle(
                      color: Color(0xFF7A7B7D),
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                color: Color(0xFF0260FF),
                height: 10,
              ),
              MyMainButton(
                  title: "Apply now",
                  color: Color(0xFF0260FF),
                  borderColor: Color(0xFF0260FF),
                  titleColor: Colors.white,
                  onTap: (){

                  }
              ),
              Container(
                color: Color(0xFF0260FF),
                height: 10,
              )
            ],
          ),
        )
    );
  }
}

