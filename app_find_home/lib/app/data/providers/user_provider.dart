import 'dart:convert';

import 'package:app_find_home/app/data/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UserProvider {
  String _basePath = "https://api-reservation-flutter.herokuapp.com";

  Future<String> insertUser({
    @required UserModel? userModel
  })async {
    final _dio = Dio();
    final response = await _dio.post(
      _basePath + "/api/user/register",
      data: json.encode(userModel?.toJson())
    );

    return response.data["message"];
  }
}