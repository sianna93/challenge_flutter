import 'package:app_find_home/app/data/model/house_model.dart';
import 'package:get/get.dart';

class DetailController extends GetxController{
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


}