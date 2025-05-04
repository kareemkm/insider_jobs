import 'package:flutter/material.dart';
import 'package:insider_jobs/view/widgets/my_app_bar.dart';
import 'package:insider_jobs/view/widgets/my_drawer.dart';
import 'package:insider_jobs/view/widgets/my_job_item.dart';

import '../../../data/model/job.dart';
import '../../../data/network/job_api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchInput = TextEditingController();

  late Future<List<Job>> jobs;

  List<Job> allJobs = [];

  List<Job> filteredJobs = [];

  @override
  void initState() {
    super.initState();
    jobs = JobApiService().fetchJobs();
  }

  Future<void> _refreshData() async {
    jobs = JobApiService().fetchJobs();
    setState(() {
      searchInput.text = "";
      filteredJobs = allJobs;
    });
  }

  void filterJobs(String query) {
    final result =
        allJobs
            .where(
              (job) => job.title.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
    setState(() {
      filteredJobs = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(title: "Home"),
      drawer: MyDrawer(),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        color: Colors.white,
        backgroundColor: Color(0xFF0260FF),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF4F0487), Color(0xFF130121)],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Text(
                              "Over 10,000+ jobs to apply",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Your Next Big Career Move Starts Right Here Explore the Best\nJob Opportunities and Take the First Step Toward Your Future!",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: double.maxFinite,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextField(
                                controller: searchInput,
                                onChanged: filterJobs,
                                decoration: InputDecoration(
                                  hintText: "Search for jobs",
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                  suffixIcon: Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF0260FF),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      "Search",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 13,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        "Latest jobs",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Get your desired job from top companies",
                        style: TextStyle(
                          color: Color(0xFF797484),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ];
          },
          body: FutureBuilder(
            future: jobs,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(color: Color(0xFF0260FF)),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Icon(
                    Icons.error_outline,
                    size: 50,
                    color: Color(0xFF0260FF),
                  ),
                );
              } else {
                if (allJobs.isEmpty) {
                  allJobs = snapshot.data!;
                  filteredJobs = allJobs;
                }
              }

              final listJobs = filteredJobs.reversed.toList();
              return ListView.builder(
                itemCount: listJobs.length,
                itemBuilder: (context, index) {
                  final job = listJobs[index];
                  return MyJobItem(job: job);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
