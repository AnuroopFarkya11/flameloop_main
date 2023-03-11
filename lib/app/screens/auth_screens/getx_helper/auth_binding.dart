
import 'package:flameloop/app/screens/auth_screens/getx_helper/controller/auth_controller.dart';
import 'package:get/get.dart';

class MobileAuthBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}