import 'package:dio/dio.dart';
import 'package:insider_jobs/utils/token.dart';


class AddJobService {

  final Dio _dio = Dio();


  Future<Map<String,dynamic>> addJob (
      String title,
      String description,
      String location,
      String category,
      String level,
      int salary
      ) async {

    final String url = 'https://job-portal-full-stack-server-beryl.vercel.app/api/company/post-job';

    String? token = await getToken() ;

    final response = await _dio.post(
      url,
      data: {
        "title": title,
        "description": description,
        "location": location,
        "category": category,
        "level": level,
        "salary": salary
      },
      options: Options(
        headers: {
          "token": token
        }
      )
    );

    return response.data ;

  }
}