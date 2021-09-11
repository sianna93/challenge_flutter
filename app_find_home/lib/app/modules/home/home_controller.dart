import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:app_find_home/app/data/model/house_model.dart';
import 'package:app_find_home/app/data/model/request_token.dart';
import 'package:app_find_home/app/data/model/user_model.dart';
import 'package:app_find_home/app/data/repositories/house_repository.dart';
import 'package:app_find_home/app/data/repositories/local/storage_repository.dart';
import 'package:app_find_home/app/data/repositories/user_repository.dart';
import 'package:app_find_home/app/routes/routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  final _storageRepository = Get.find<StorageRepository>();
  final _userRepository = Get.find<UserRepository>();
  final _houseRepository = Get.find<HouseRepository>();

  late RequestToken _requestToken;

  UserModel _userSession = UserModel();
  UserModel get userModel => _userSession;


  // Variables reactivas
  RxInt indexCategorySelected = RxInt(0);
  RxString address = RxString("");//"".obs
  RxString name =  RxString("");//"".obs

  RxList<HouseModel> _houses =  RxList([]);
  List<HouseModel> get houses => _houses;


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

       _userSession =  await _userRepository.getInformation(
        token: _requestToken.requestToken ?? "",
        idUser: _requestToken.idUser ?? 0,
      );

      address.value = _userSession.address ?? "";
      name.value = _userSession.name ?? "";

    } on DioError catch(e) {
      if(e.response!.statusCode == 401){
        Get.offNamed(AppRoutes.LOGIN);
      } else {
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
  }

  selectedIndex(int index) {
    indexCategorySelected.value = index;
  }

  logout() async {
    try {
      await _storageRepository.deleteSession();
      Get.offNamed(AppRoutes.LOGIN);
    } catch(e) {
      Get.snackbar(
          "Message",
          e.toString(),
          colorText: Colors.white,
          duration: Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppTheme.cyan
      );
    }
  }


  _loadHouses() async {

    try{
      _requestToken = await _storageRepository.getSession();
      print(_requestToken.requestToken ?? "NO REQUEST TOKEN");
      _houses.value = await _houseRepository.getHouses(
          token: _requestToken.requestToken ?? ""
      );

      print(_houses.length);
    } on DioError catch(e) {
      print(e);
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
