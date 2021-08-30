import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:app_find_home/app/data/model/request_token.dart';
import 'package:app_find_home/app/data/repositories/local/storage_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  final _storageRepository = Get.find<StorageRepository>();
  late RequestToken _requestToken;

  RxString address = RxString("");//"".obs
  RxString name =  RxString("");//"".obs
  @override
  void onInit() {
    _loadStorage();
    _loadHouses();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

  }

  _loadStorage() async {

    try{
      _requestToken = await _storageRepository.getSession();
       /*_userModel =  await _userRepository.getInformation(
        toke: _requestToken.requestToken ?? "",
        userID: _requestToken.idUser ?? 0,
      );

      address.value = _userModel[0].address ?? "";
      name.value = _userModel[0].name ?? "";

      print(address.value);
      print(name.value);*/

    } on DioError catch(e) {
      Get.snackbar(
          "Message",
          e.response?.data("message"),
          colorText: Colors.white,
          duration: Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppTheme.cyan
      );
    }
  }





  _loadHouses() {

   /* try{
      _houses.value = _houseRepository.getHouses(
          token: _requestToken.requestToken
      );

      print(_houses.length);
    } on DioError catch(e) {
      Get.snackbar(
          "Message",
          e.response?.data("message"),
          colorText: Colors.white,
          duration: Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppTheme.background
      );
    }*/
  }

}
