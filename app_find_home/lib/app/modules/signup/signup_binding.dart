import 'package:app_find_home/app/modules/signup/signup_controller.dart';
import 'package:get/get.dart';

class SingupBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SingupController());
  }

}