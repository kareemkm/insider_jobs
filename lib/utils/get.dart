import 'package:insider_jobs/view/widgets/course_card.dart';

String getLevelText(CourseLevel level) {
  switch (level) {
    case CourseLevel.beginner:
      return 'Beginner';
    case CourseLevel.intermediate:
      return 'Intermediate';
    case CourseLevel.advanced:
      return 'Advanced';
  }
}