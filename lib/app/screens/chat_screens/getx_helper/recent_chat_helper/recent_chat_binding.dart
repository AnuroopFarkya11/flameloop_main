
import 'package:get/get.dart';

import 'recent_chat_controller.dart';

class ChatRoomBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<RecentChatController>(() => RecentChatController());
  }

}