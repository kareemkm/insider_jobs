import 'package:dio/dio.dart';
import 'package:insider_jobs/utils/token.dart';

import '../model/job_date.dart';

class JobDateService {

  final Dio _dio = Dio();

  Future<List<JobDate>> fetchJobsDate() async {

    final String url = "https://job-portal-full-stack-server-beryl.vercel.app/api/company/list-jobs" ;

    String? token = await getToken();

    final response = await _dio.get(
        url,
      options: Options(
        headers: {
          "token": token
        }
      )
    );

    List jobsDate = response.data['jobsData'];

    return jobsDate.map((jobDate)=> JobDate.fromJson(jobDate)).toList();
  }
}