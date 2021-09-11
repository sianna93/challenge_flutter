import 'package:app_find_home/app/modules/home/home_controller.dart';
import 'package:get/get.dart';

import 'profile_controller.dart';

class ProfileBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => HomeController());
  }

}