class JobDate{

  final String id;
  final String title;
  final String description;
  final String location;
  final String category;
  final String level;
  final int salary;
  final DateTime date;
  final bool visible;
  final String companyId;
  final int applicants;

  JobDate({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.category,
    required this.level,
    required this.salary,
    required this.date,
    required this.visible,
    required this.companyId,
    required this.applicants,
  });

  factory JobDate.fromJson(Map<String, dynamic> json) {
    return JobDate(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      location: json['location'],
      category: json['category'],
      level: json['level'],
      salary: json['salary'],
      date: DateTime.fromMillisecondsSinceEpoch(json['date']),
      visible: json['visible'],
      companyId: json['companyId'],
      applicants: json['applicants'],
    );
  }}