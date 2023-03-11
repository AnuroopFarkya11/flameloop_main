
import 'package:flameloop/app/screens/auth_screens/getx_helper/controller.dart';
import 'package:get/get.dart';

class MobileAuthBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => PhoneAuthController());
  }
}