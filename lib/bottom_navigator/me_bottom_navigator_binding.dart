import 'package:get/get.dart';
import 'package:miles_ed_project/bottom_navigator/me_bottom_navigator_controller.dart';
import 'package:miles_ed_project/homepage/controller/me_homepage_controller.dart';

class MeBottomNavigatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MEBottomNavigatorController());
    Get.lazyPut<MEHomepageController>(() => MEHomepageController());
  }
}
