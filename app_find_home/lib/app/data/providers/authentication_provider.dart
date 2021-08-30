import 'package:app_find_home/app/data/model/request_token.dart';
import 'package:dio/dio.dart';

class AuthenticationProvider {
  String _basePath = "https://api-reservation-flutter.herokuapp.com";

  Future<RequestToken> authentication({
    required String email,
    required String password}) async {

    final _dio = Dio();
    final response = await _dio.post(_basePath + "/api/user/auth",
        data:{
          "email": email,
          "password": password
        }
        );
    print(response.data);

    return RequestToken.fromJson(response.data);
  }
}