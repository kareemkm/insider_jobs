import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:insider_jobs/view/widgets/my_app_bar.dart';
import 'package:insider_jobs/view/widgets/my_drawer.dart';

import '../../../data/model/application.dart';
import '../../../data/network/applications_service.dart';

class ViewApplicationsScreen extends StatefulWidget {
  const ViewApplicationsScreen({super.key});

  @override
  State<ViewApplicationsScreen> createState() => _ViewApplicationsScreenState();
}

class _ViewApplicationsScreenState extends State<ViewApplicationsScreen> {

  late Future<List<Application>> applications ;
  @override
  void initState(){
    super.initState();

    applications = ApplicationService().fetchApplication();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(title: "View Application"),
      drawer: MyDrawer(),
      body: FutureBuilder(
          future: applications,
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
            }else if (snapshot.hasError){
              return  SizedBox(
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

            final applicationList = snapshot.data! ;

            return Column(
              children: [
                SizedBox(height: 20,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                        columns: [
                          DataColumn(label: Text("#")),
                          DataColumn(label: Text("User name")),
                          DataColumn(label: Text("Job Title")),
                          DataColumn(label: Text("Location")),
                          DataColumn(label: Text("Resume")),
                          DataColumn(label: Text("Action"))
                        ],
                        rows: List.generate(
                            applicationList.length,
                                (index){
                              return DataRow(
                                  cells: [
                                    DataCell(Text("${index+1}",style: TextStyle(color: Colors.black.withOpacity(0.5)))),
                                    DataCell(
                                        Row(
                                          children: [
                                            ClipOval(
                                              child: Image.network(
                                                  applicationList[index].image,
                                                height: 35,
                                                width: 35,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Text(applicationList[index].userName,style: TextStyle(color: Colors.black.withOpacity(0.5)))
                                          ],
                                        )
                                    ),
                                    DataCell(Text(applicationList[index].jobTitle,style: TextStyle(color: Colors.black.withOpacity(0.5)))),
                                    DataCell(Text(applicationList[index].jobLocation,style: TextStyle(color: Colors.black.withOpacity(0.5)),)),
                                    DataCell(
                                      GestureDetector(
                                        onTap: () async {
                                          try {
                                            await FileDownloader.downloadFile(
                                                url: applicationList[index].resumeUrl.trim(),
                                                name: "resume_${index + 1}.jpg",
                                                onDownloadCompleted: (value){
                                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success download")));
                                                },
                                                onDownloadError: (error){
                                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error download")));
                                                }
                                            );
                                          }catch(e){
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));

                                          }
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 5,vertical: 3),
                                          decoration: BoxDecoration(
                                              color: Color(0xFF007AFF).withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Resume",
                                                style: TextStyle(
                                                    color: Color(0xFF007AFF)
                                                ),
                                              ),
                                              SizedBox(width: 10,),
                                              Icon(
                                                  Icons.file_download_outlined,
                                                  color: Color(0xFF007AFF)
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ),
                                    DataCell(
                                      GestureDetector(
                                        onTap: (){

                                        },
                                        child: Icon(
                                          Icons.more_horiz,
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                      )
                                    ),
                                  ]
                              );
                            }
                        )
                    ),
                  ),
                )
              ],
            );
          }
      )
    );
  }
}
