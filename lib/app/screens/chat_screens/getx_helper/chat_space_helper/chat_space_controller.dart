import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../models/chat_space_model/chat_space_model.dart';
import '../../../../services/firebase.dart';
import '../../../../services/user.dart';
import 'chat_space_state.dart';


class ChatSpaceController extends GetxController{
  final state = ChatSpaceState();
  ChatSpaceController();
  final textController = TextEditingController();
  final msgScrolling = ScrollController();
  FocusNode contentNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    var chatData = Get.parameters;
    state.chatRoomId.value = chatData['chatRoomId']?? '';
    state.toUserProfile.value = chatData['toUserProfile']?? '';
    state.toUserName.value = chatData['toUserName']?? '';
    state.toUserUid.value = chatData['toUserUid']?? '';
  }

  sendMessage() async {
    String sendContent = textController.text;
    textController.clear();
    if(sendContent != ''){
      final content = ChatSpaceModel(
        message: sendContent,
        sendBy: state.toUserUid.value,
        messageTm: DateTime.now(),
        sendByPhoto: UserStore.to.profile.photoId,
      );
      await FirebaseFireStore
          .to.sendMessage(
          content.toJson(), state.chatRoomId.value
      ).then((value) {
        Get.focusScope?.unfocus();
      });
      log(content.messageTm.toIso8601String());
      await FirebaseFireStore.to.updateMessage(
          {
            "lastMessage": sendContent,
            "lastMessageBy": state.toUserUid.value,
            "lastMessageTm": content.messageTm.toIso8601String()
          },
          state.chatRoomId.value
      );
    }
  }

  @override
  void onReady() {
    super.onReady();
    var messages = FirebaseFireStore.to.readMessage(state.chatRoomId.value);
    state.chatData.clear();
    messages.listen((snapshot) {
      for (var change in snapshot.docChanges) {
        switch (change.type) {
          case DocumentChangeType.added :
            if (change.doc.data() != null) {
              state.chatData.insert(
                0,
                ChatSpaceModel.fromJson(change.doc.data() as Map<String, Object?>),
              );
            }
            break;
          case DocumentChangeType.modified: break;
          case DocumentChangeType.removed: break;

          default: break;
        }
      }
    },onError: (error) => log("Listening failed: $error"));

    Iterable inReverse = state.chatData.reversed;
    state.chatData.value = inReverse.toList() as List<ChatSpaceModel>;
  }

  @override
  void dispose() {
    msgScrolling.dispose();
    super.dispose();
  }
}