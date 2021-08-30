import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:app_find_home/app/data/model/user_model.dart';
import 'package:app_find_home/app/data/repositories/user_repository.dart';
import 'package:app_find_home/app/global_widgets/load_spinner.dart';
import 'package:app_find_home/app/routes/routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingupController extends GetxController{

  final _userRepository = Get.find<UserRepository>();

  //Variables
  String _name = "";
  String _lastName = "";
  String _address = "";
  String _email = "";
  String _password = "";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  singup( UserModel userModel)async {
    try {
      LoadSpinner.show();
      String _response = await _userRepository.insertUser(userModel: userModel);
      LoadSpinner.hide();
      print(_response);
      Get.snackbar(
          "Success",
          _response,
          duration: Duration(seconds: 3),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: AppTheme.background

      );

        Get.offNamed(AppRoutes.LOGIN,
            // arguments: _requestToken
        );

    } on DioError catch (e){
      LoadSpinner.hide();
      print(e.message);
      Get.snackbar(
          "Message",
          e.response?.data["message"],
          duration: Duration(seconds: 3),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: AppTheme.background

      );
    }
  }
}