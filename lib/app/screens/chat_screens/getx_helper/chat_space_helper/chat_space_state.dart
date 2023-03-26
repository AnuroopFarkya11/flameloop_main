import 'package:get/get.dart';

import '../../../../models/chat_space_model/chat_space_model.dart';

class ChatSpaceState {
  var _isLoading = true.obs;
  RxList<ChatSpaceModel> chatData = <ChatSpaceModel>[].obs;
  var toUserProfile = ''.obs;
  var toUserName = ''.obs;
  var toUserUid = ''.obs;
  var chatRoomId = ''.obs;

  /* This is the getter */
  get isLoading => _isLoading.value;

  /* This is the setter */
  set isLoading(value) {
    _isLoading = value;
  }
}