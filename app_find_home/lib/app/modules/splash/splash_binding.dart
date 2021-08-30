import 'package:app_find_home/app/modules/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings{

  // Setear los controllers
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }

}