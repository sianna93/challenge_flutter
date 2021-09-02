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

  Future<UserModel> getInformation({
    required String token,
    required int idUser
  })async {
    final _dio = Dio();
    final response = await _dio.get(
        _basePath + "/api/user/information/${idUser}",
        // queryParameters: {"id": idUser},
        options: Options(headers: {"auth": token})
    );

    if (response.data["information"] != null) {
      print(response.data["information"]);
      var userModeList = (response.data["information"] as List)
          .map((item) => UserModel.fromJson(item))
          .toList();

      return userModeList[0];
    } else {
      return new UserModel(id: 0, name: "Invitado", email: "invitado@gmai.com");
    }


  }
}