import 'package:app_find_home/app/data/model/request_token.dart';
import 'package:app_find_home/app/data/repositories/local/storage_repository.dart';
import 'package:app_find_home/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  final _storageRepository = Get.find<StorageRepository>();
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
      Duration(milliseconds: 500), () async {
        RequestToken requestToken = await _storageRepository.getSession();
        if (requestToken != null && requestToken.requestToken != null) {
          Get.offNamed(AppRoutes.HOME);
        } else {
          Get.offNamed(AppRoutes.LOGIN);
        }

    }
    );
  }
}