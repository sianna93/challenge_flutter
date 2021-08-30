import 'package:app_find_home/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    _loadLogin();
    super.onReady();

  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  _loadLogin() async {
    await Future.delayed(
      Duration(milliseconds: 500), () {
        Get.offNamed(AppRoutes.LOGIN);
    }
    );
  }
}