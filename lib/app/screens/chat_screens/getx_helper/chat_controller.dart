
import 'dart:developer';

import 'package:get/get.dart';

import '../../../models/chat_room_model/chat_room_model.dart';
import '../../../models/users/user_model.dart';
import '../../../routes/route_path.dart';
import '../../../services/firebase.dart';

class ChatController extends GetxController{
  RxList<UserModel> users = <UserModel>[].obs;
  var isLoading = false.obs;

  @override
  Future<void> onInit() async {
    await loadUsers();
    super.onInit();
  }

  loadUsers() async {
    isLoading.value = true;
    users.value = [];
    log('Fetching user data');
    var usersData = FirebaseFireStore.to.getAllUsers();
    log('Fetching user data complete');
    usersData.listen((userSnapshot) {
      log('UserList: ');

      for(var userElement in userSnapshot.docs){
        log('UserList: ${userElement.data()}');
        users.add(
          UserModel.fromJson(userElement.data() as Map<String, dynamic>)
        );
      }
    });
    isLoading.value = false;
  }

  createChatRoom(ChatRoomModel chatRoomModel, UserModel otherUser) async {
    await FirebaseFireStore.to.createChatRoom(chatRoomModel);
    Get.toNamed(
        RoutePaths.chatScreen,
        parameters: {
          "chatRoomId": chatRoomModel.chatRoomId,
          "toUserProfile": otherUser.photoId,
          "toUserName": otherUser.username,
          "toUserUid": otherUser.uid
        }
    );
  }

  generateChatRoomId(String myUserUid, String otherUserId) {
    if (myUserUid.substring(0, 1).codeUnitAt(0) > otherUserId.substring(0, 1).codeUnitAt(0)) {
      return "$otherUserId\_$myUserUid";
    } else {
      return "$myUserUid\_$otherUserId";
    }
  }
}