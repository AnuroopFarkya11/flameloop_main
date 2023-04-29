import 'package:get/get.dart';

import 'community_chat_space_controller.dart';

class CommunityChatSpaceBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => CommunityChatSpaceController());
  }

}