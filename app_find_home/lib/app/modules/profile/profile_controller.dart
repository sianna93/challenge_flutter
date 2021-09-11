import 'package:app_find_home/app/data/model/user_model.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{

  UserModel userModel = new UserModel();
  @override
  void onInit() {
    // TODO: implement onInit
    this.userModel = Get.arguments as UserModel;
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}