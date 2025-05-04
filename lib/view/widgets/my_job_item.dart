import 'package:flutter/material.dart';
import 'package:insider_jobs/view/screens/home/job_information_screen.dart';
import 'package:insider_jobs/view/widgets/my_box_tab.dart';
import 'package:insider_jobs/view/widgets/my_main_button.dart';

import '../../data/model/job.dart';

class MyJobItem extends StatelessWidget {

  final Job job;

  const MyJobItem({
    super.key,
    required this.job
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
            color: Color(0xFF636363).withOpacity(0.4),
            width: 1.5
        ),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            job.companyId.image,
            height: 60,
          ),
          SizedBox(height: 10,),
          Text(
            job.title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18
            ),
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              MyBoxTab(title: job.location, color: Color(0xFF8BC3FF)),
              SizedBox(width: 10,),
              MyBoxTab(title: job.level, color: Color(0xFFFFBABA))
            ],
          ),
          SizedBox(height: 20,),
          Text(
            job.description,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF636363)
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyMainButton(
                  title: "Apply now",
                  color: Color(0xFF0260FF),
                  borderColor: Color(0xFF0260FF),
                  titleColor: Colors.white,
                  onTap: (){

                  }
              ),
              SizedBox(width: 20,),
              MyMainButton(
                  title: "Learn more",
                  color: Colors.white,
                  borderColor: Color(0xFF838383).withOpacity(0.5),
                  titleColor: Color(0xFF838383),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => JobInformationScreen(job: job))
                    );
                  }
              )
            ],
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
