import 'package:get/get.dart';

import 'chat_space_controller.dart';

class ChatSpaceBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<ChatSpaceController>(() => ChatSpaceController());
  }
}