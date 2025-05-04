import 'package:dio/dio.dart';
import 'package:insider_jobs/utils/token.dart';

import '../model/application.dart';


class ApplicationService {

  final Dio _dio = Dio();

  Future<List<Application>> fetchApplication() async {

    final String url = "https://job-portal-full-stack-server-beryl.vercel.app/api/company/applicants" ;

    String? token = await getToken();

    final response = await _dio.get(
      url,
      options: Options(
        headers: {
          "token": token
        }
      )
    );

    List applications = response.data['applications'];

    return applications.map((application)=>Application.fromJson(application)).toList();
  }

}