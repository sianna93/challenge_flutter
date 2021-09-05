import 'package:app_find_home/app/core/config/config.dart';
import 'package:app_find_home/app/data/model/request_token.dart';
import 'package:dio/dio.dart';

class AuthenticationProvider {

  Future<RequestToken> authentication({
    required String email,
    required String password}) async {

    final _dio = Dio();
    final response = await _dio.post(BASEPATH + "/api/user/auth",
        data:{
          "email": email,
          "password": password
        }
        );
    print(response.data);

    return RequestToken.fromJson(response.data);
  }
}