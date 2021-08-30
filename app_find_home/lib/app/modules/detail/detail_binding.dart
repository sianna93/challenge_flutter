
import 'package:app_find_home/app/modules/detail/detail_controller.dart';
import 'package:get/get.dart';

class DetailBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => DetailController());
  }

}