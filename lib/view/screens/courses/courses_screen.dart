import 'package:flutter/material.dart';
import 'package:insider_jobs/view/widgets/my_app_bar.dart';
import 'package:insider_jobs/view/widgets/my_drawer.dart';
import 'package:insider_jobs/view/widgets/stats_section.dart';
import 'package:insider_jobs/view/widgets/course_card.dart';

import '../../../utils/courses_data.dart';
import 'course_information.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const MyDrawer(),
      appBar: MyAppBar(title: "Courses",color: Colors.purple),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const Text(
                      'Professional Development Courses',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Enhance your skills with our expert-led courses',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    const StatsSection(),
                  ],
                ),
              ),
            ),
          ];
        },
        body: ListView.builder(
          padding: const EdgeInsets.only(bottom: 16),
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return CourseCard(
              imageUrl: course['imageUrl'] as String,
              level: course['level'] as CourseLevel,
              title: course['title'] as String,
              description: course['description'] as String,
              instructor: course['instructor'] as String,
              duration: course['duration'] as String,
              price: course['price'] as double,
              onClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseInformation(course: course),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
