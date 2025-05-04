import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insider_jobs/utils/token.dart';

class AuthService {

  final Dio _dio = Dio();


  Future<Map<String,dynamic>> signUp(String name , String email , String password , XFile? image)  async {

    final String url = 'https://job-portal-full-stack-server-beryl.vercel.app/api/company/register';

    FormData formData = FormData.fromMap({
      'name': name,
      'email': email,
      'password': password,
      if (image != null) 'image': await MultipartFile.fromFile(image.path, filename: image.name),
    });

    final response = await _dio.post(
        url,
      data: formData,
    );

    return response.data ;
  }



  Future<Map<String,dynamic>> login(String email , String password) async {

    final String url = 'https://job-portal-full-stack-server-beryl.vercel.app/api/company/login';

    final response = await _dio.post(
        url,
        data: {
          "email": email,
          "password": password,
        }
    );

    if(response.data['success']){
      String token = response.data['token'] ;
      saveToken(token);
    }

    return response.data ;

  }
}














