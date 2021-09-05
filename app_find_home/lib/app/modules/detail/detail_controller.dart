import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:app_find_home/app/data/model/house_model.dart';
import 'package:app_find_home/app/data/model/request_token.dart';
import 'package:app_find_home/app/data/model/reservation_model.dart';
import 'package:app_find_home/app/data/repositories/local/storage_repository.dart';
import 'package:app_find_home/app/data/repositories/reservation_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends GetxController{
  final _storageRepository = Get.find<StorageRepository>();
  final _reservationRepository = Get.find<ReservationRepository>();

  late RequestToken _requestToken;
  HouseModel _houseModel = HouseModel();
  HouseModel get houseModel => _houseModel;
  @override
  void onInit() {
    this._houseModel = Get.arguments as HouseModel;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void register({required ReservationModel reservationModel}) async {
    try {
      _requestToken = await _storageRepository.getSession();
      reservationModel.idUser = _requestToken.idUser;
      var response = await _reservationRepository.saveReservation(
          token: _requestToken.requestToken ?? "",
          reservationModel: reservationModel
      );

      Get.snackbar(
          "Message",
          response,
          colorText: Colors.white,
          duration: Duration(seconds: 5),
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppTheme.background
      );

      print (response);

    } on DioError catch(e) {
      Get.snackbar(
          "Message",
          e.response?.data("message"),
          colorText: Colors.white,
          duration: Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppTheme.background
      );
    }
  }


}