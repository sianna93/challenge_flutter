import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:app_find_home/app/data/model/request_token.dart';
import 'package:app_find_home/app/data/repositories/authentication_repository.dart';
import 'package:app_find_home/app/data/repositories/local/storage_repository.dart';
import 'package:app_find_home/app/global_widgets/load_spinner.dart';
import 'package:app_find_home/app/routes/routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  // Repositories
  final _authRepository = Get.find<AuthenticationRepository>();
  final _storageRepository = Get.find<StorageRepository>();

  //Variables
  String _email = "";
  String _password = "";

  RequestToken _requestToken = RequestToken();
  RequestToken get requestToken => _requestToken;

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

  void onChangeEmail(String value) {
    print(value);
    _email = value;
  }


  void onChangePassword(String value) => _password = value;

  // en los controllers se capturan los errores de requests
  auth() async {
    try{
      LoadSpinner.show();
      _requestToken = await _authRepository.authentication(email: _email, password: _password);

      if (requestToken.succes ?? false ) {
          await _storageRepository.setSession(requestToken: _requestToken);

          Get.offNamed(AppRoutes.HOME);
      } else {
        LoadSpinner.hide();
      }
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