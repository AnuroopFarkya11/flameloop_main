import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../models/chat_room_model/chat_room_model.dart';
import '../../../../models/users/user_model.dart';
import '../../../../routes/route_path.dart';
import '../../../../services/firebase.dart';
import '../../../../services/user.dart';
import 'recent_chat_state.dart';

class RecentChatController extends GetxController {
  final state = RecentChatState();
  var index = 0.obs;
  RxList<UserModel> users = <UserModel>[].obs;
  final myUserId = UserStore.to.uid;
  var isLoading = true.obs;

  final RefreshController refreshController2 = RefreshController(initialRefresh: true);

  @override
  Future<void> onInit() async {
    await asyncLoadData();
    super.onInit();
  }

  onRefreshLoadUser() {
    loadUsers().then(
        (_) => refreshController2.refreshCompleted(resetFooterState: true));
  }

  // @override
  // Future<void> onReady() async {
  //   super.onReady();
  //   state.otherUser.value = [];
  //   state.chatRoomList.value = [];
  //   var chatRoomList = FirebaseFireStore.to.getChatRoom();
  //   chatRoomList.listen((snapshot) async {
  //     isLoading.value = true;
  //     log('Loading');
  //     for (var chatRoom in snapshot.docChanges) {
  //       switch (chatRoom.type) {
  //         case DocumentChangeType.added:
  //           if (chatRoom.doc.data() != null) {
  //             Map<String, dynamic> chatRoomData = chatRoom.doc.data() as Map<String, dynamic>;
  //             state.chatRoomList.add(
  //                 ChatRoomModel.fromJson(chatRoomData)
  //             );
  //             if(chatRoomData['users'][0] == myUserId){
  //               state.otherUser.add(
  //                   (await FirebaseFireStore.to.getUser(chatRoomData['users'][1]))!
  //               );
  //             }else{
  //               state.otherUser.add(
  //                   (await FirebaseFireStore.to.getUser(chatRoomData['users'][0]))!
  //               );
  //             }
  //           }
  //           break;
  //         case DocumentChangeType.modified:
  //           if (chatRoom.doc.data() != null) {
  //             log('This is the change: ${chatRoom.doc.data()}');
  //             Map<String, dynamic> chatRoomData = chatRoom.doc.data() as Map<String, dynamic>;
  //             int changeIndex = state.chatRoomList.indexWhere((element) => element.chatRoomId == chatRoomData['chatRoomId']);
  //             state.chatRoomList[changeIndex] = state.chatRoomList[changeIndex].copyWith(
  //               lastMessage: chatRoomData['lastMessage'],
  //               lastMessageBy: chatRoomData['lastMessageBy'],
  //               lastMessageTm: DateTime.parse(chatRoomData['lastMessageTm']),
  //             );
  //             print('This is update: ${state.chatRoomList}');
  //           }
  //           break;
  //         case DocumentChangeType.removed:
  //           break;
  //       }
  //     }
  //     isLoading.value = false;
  //     log('Loading completed');
  //   }, onError: (error) => log("Listening failed: $error"));
  //   isLoading.value = false;
  //   await loadUsers();
  // }

  loadUsers() async {
    isLoading.value = true;
    users.value = [];
    log('Fetching user data');
    var usersData = FirebaseFireStore.to.getAllUsers();
    log('Fetching user data complete');
    usersData.listen((userSnapshot) {
      log('UserList: ');

      for (var userElement in userSnapshot.docs) {
        log('UserList: ${userElement.data()}');
        users.add(
            UserModel.fromJson(userElement.data() as Map<String, dynamic>));
      }
    });
    isLoading.value = false;
  }

  asyncLoadData() async {
    isLoading.value = true;
    var chatRoomList = FirebaseFireStore.to.getChatRoom();
    chatRoomList.listen((snapshot) async {
      isLoading.value = true;
      log('Loading');
      for (var chatRoom in snapshot.docChanges) {
        switch (chatRoom.type) {
          case DocumentChangeType.added:
            if (chatRoom.doc.data() != null) {
              Map<String, dynamic> chatRoomData = chatRoom.doc.data() as Map<String, dynamic>;
              state.chatRoomList.add(
                  ChatRoomModel.fromJson(chatRoomData)
              );
              if(chatRoomData['users'][0] == myUserId){
                state.otherUser.add(
                    (await FirebaseFireStore.to.getUser(chatRoomData['users'][1]))!
                );
              }else{
                state.otherUser.add(
                    (await FirebaseFireStore.to.getUser(chatRoomData['users'][0]))!
                );
              }
            }
            break;
          case DocumentChangeType.modified:
            if (chatRoom.doc.data() != null) {
              log('This is the change: ${chatRoom.doc.data()}');
              Map<String, dynamic> chatRoomData = chatRoom.doc.data() as Map<String, dynamic>;
              int changeIndex = state.chatRoomList.indexWhere((element) => element.chatRoomId == chatRoomData['chatRoomId']);
              state.chatRoomList[changeIndex] = state.chatRoomList[changeIndex].copyWith(
                lastMessage: chatRoomData['lastMessage'],
                lastMessageBy: chatRoomData['lastMessageBy'],
                lastMessageTm: DateTime.parse(chatRoomData['lastMessageTm']),
              );
              print('This is update: ${state.chatRoomList}');
            }
            break;
          case DocumentChangeType.removed:
            break;
        }
      }
      isLoading.value = false;
      log('Loading completed');
    }, onError: (error) => log("Listening failed: $error"));
  }

  createChatRoom(ChatRoomModel chatRoomModel, UserModel otherUser) async {
    await FirebaseFireStore.to.createChatRoom(chatRoomModel);
    Get.toNamed(RoutePaths.chatScreen, parameters: {
      "chatRoomId": chatRoomModel.chatRoomId,
      "toUserProfile": otherUser.photoId,
      "toUserName": otherUser.username,
      "toUserUid": otherUser.uid
    });
  }

  generateChatRoomId(String myUserUid, String otherUserId) {
    if (myUserUid.substring(0, 1).codeUnitAt(0) >
        otherUserId.substring(0, 1).codeUnitAt(0)) {
      return "$otherUserId\_$myUserUid";
    } else {
      return "$myUserUid\_$otherUserId";
    }
  }
}
