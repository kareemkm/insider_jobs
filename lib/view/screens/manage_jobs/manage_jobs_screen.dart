import 'package:flutter/material.dart';
import 'package:insider_jobs/view/screens/add_jobs/add_jobs_screen.dart';
import 'package:insider_jobs/view/widgets/my_app_bar.dart';
import 'package:insider_jobs/view/widgets/my_drawer.dart';
import 'package:intl/intl.dart';

import '../../../data/model/job_date.dart';
import '../../../data/network/job_date_service.dart';

class ManageJobsScreen extends StatefulWidget {
  const ManageJobsScreen({super.key});

  @override
  State<ManageJobsScreen> createState() => _ManageJobsScreenState();
}

class _ManageJobsScreenState extends State<ManageJobsScreen> {

  late Future<List<JobDate>> jobsDate ;

  @override
  void initState(){
    super.initState();

    jobsDate = JobDateService().fetchJobsDate();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(title: "Manage Jobs"),
      drawer: MyDrawer(),
      body: FutureBuilder(
          future: jobsDate,
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFF0260FF),
                    )
                ),
              );
            }else if(snapshot.hasError){
              return SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Center(
                    child: Icon(
                      Icons.error_outline,
                      size: 50,
                      color: Color(0xFF0260FF),
                    )
                ),
              );
            }

            final listJobsDate = snapshot.data! ;
            return Column(
              children: [
              SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                    columns: const [
                      DataColumn(label: Text("#")),
                      DataColumn(label: Text("Job Title")),
                      DataColumn(label: Text("Date")),
                      DataColumn(label: Text("Location")),
                      DataColumn(label: Text("Applicants")),
                      DataColumn(label: Text("Visible")),
                    ],
                    rows: List.generate(
                        listJobsDate.length,
                            (index){
                          return DataRow(
                              cells: [
                                DataCell(Text("${index+1}")),
                                DataCell(Text(listJobsDate[index].title)),
                                DataCell(Text(DateFormat('dd MMM yyyy').format(listJobsDate[index].date))),
                                DataCell(Text(listJobsDate[index].location)),
                                DataCell(Text("${listJobsDate[index].applicants}")),
                                DataCell(
                                    Icon(
                                      listJobsDate[index].visible ? Icons.check : Icons.clear,
                                      color:  listJobsDate[index].visible ? Colors.green : Colors.red,
                                    )
                                ),
                              ]
                          );
                        }
                    )
                ),
              ),
            ),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> AddJobsScreen()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          child: Text(
                            'Add new job',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
      ),

    );
  }
}
