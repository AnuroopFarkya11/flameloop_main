import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flameloop/app/models/community_model/community_model.dart';
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
  var loadingCommunity = true.obs;

  final RefreshController refreshController2 = RefreshController(initialRefresh: true);

  @override
  Future<void> onInit() async {
    getAllCommunity();
    asyncLoadData();
    super.onInit();
  }

  onRefreshLoadUser() {
    loadUsers().then(
        (_) => refreshController2.refreshCompleted(resetFooterState: true));
  }

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
              log('This is update: ${state.chatRoomList}');
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

  getAllCommunity() async {
    state.communityList.clear();
    var communityData = FirebaseFireStore.to.getAllCommunity();
    communityData.listen((snapshot) {
      loadingCommunity.value = true;
      for(var community in snapshot.docChanges){
        switch(community.type){
          case DocumentChangeType.added:
            state.communityList.add(CommunityModel.fromJson(community.doc.data() as Map<String, dynamic>));
            break;
          case DocumentChangeType.removed:
            state.communityList.remove(CommunityModel.fromJson(community.doc.data() as Map<String, dynamic>));
            break;
          case DocumentChangeType.modified:
            if (community.doc.data() != null) {
              log('This is the change: ${community.doc.data()}');
              Map<String, dynamic> communityData = community.doc.data() as Map<String, dynamic>;
              int changeIndex = state.communityList.indexWhere((element) => element.communityId == communityData['communityId']);
              state.communityList[changeIndex] = state.communityList[changeIndex].copyWith(
                lastMessage: communityData['lastMessage'],
                lastMessageBy: communityData['lastMessageBy'],
                lastMessageTm: DateTime.parse(communityData['lastMessageTm']),
              );
              log('This is update: ${state.communityList}');
            }
            break;
        }
      }
      loadingCommunity.value = false;
      log('This is the community list: ${state.communityList}');
    });
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
