
import 'company.dart';

class Job {
  final String id ;
  final String title ;
  final String description ;
  final String location ;
  final String category ;
  final String level ;
  final int date ;
  final bool visible ;
  final int salary ;
  final Company companyId ;

  Job({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.category,
    required this.level,
    required this.date,
    required this.visible,
    required this.salary,
    required this.companyId
  });

  factory Job.fromJson(Map<String,dynamic> json) {
    return Job(
        id: json['_id'],
        title: json['title'],
        description: json['description'],
        location: json['location'],
        category: json['category'],
        level: json['level'],
        date: json['date'],
        visible: json['visible'],
        salary: json['salary'],
        companyId: Company.fromJson(json['companyId']),
    );
  }
}