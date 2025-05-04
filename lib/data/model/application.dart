class Application {
  final String image ;
  final String userName;
  final String resumeUrl;
  final String jobTitle;
  final String jobLocation;

  Application({
    required this.image,
    required this.userName,
    required this.resumeUrl,
    required this.jobTitle,
    required this.jobLocation,
  });

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      image: json['userId']['image'],
      userName: json['userId']['name'],
      resumeUrl: json['userId']['resume'],
      jobTitle: json['jobId']['title'],
      jobLocation: json['jobId']['location'],
    );
  }
}