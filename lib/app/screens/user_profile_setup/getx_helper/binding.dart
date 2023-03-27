
import 'package:flameloop/app/screens/user_profile_setup/getx_helper/controller.dart';
import 'package:get/get.dart';

class SetProfileBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => SetProfileController());
  }
}