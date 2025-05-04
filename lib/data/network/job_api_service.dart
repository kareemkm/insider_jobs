import 'package:dio/dio.dart';

import '../model/job.dart';

class JobApiService {

  final Dio _dio = Dio();

  Future<List<Job>> fetchJobs () async {

    final response = await _dio.get('https://job-portal-full-stack-server-beryl.vercel.app/api/jobs');

    if (response.statusCode == 200 && response.data['success'] == true) {
      List jobsData = response.data['jobs'];
      return jobsData.map((job) => Job.fromJson(job)).toList();
    }else {
      return  throw Exception('Failed to load jobs');
    }
  }
}