import 'package:app_find_home/app/data/model/user_model.dart';
import 'package:app_find_home/app/data/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRepository{
  final _apiProvider = Get.find<UserProvider>();

  Future<String> insertUser({
    required UserModel? userModel
  }) => _apiProvider.insertUser(userModel: userModel);

  Future<UserModel> getInformation({
    required String token,
    required int idUser
  }) => _apiProvider.getInformation(token: token, idUser: idUser);
}