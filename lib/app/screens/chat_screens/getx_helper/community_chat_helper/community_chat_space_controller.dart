
import 'dart:developer';

import 'package:flameloop/app/services/user.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/community_chat_model/community_chat_model.dart';
import '../../../../models/community_model/community_model.dart';
import '../../../../services/firebase.dart';
import 'community_chat_space_state.dart';

class CommunityChatSpaceController extends GetxController {
  final state = CommunityChatSpaceState();
  final textController = TextEditingController();
  final msgScrolling = ScrollController();
  FocusNode contentNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    var chatData = Get.arguments;
    state.communityId.value = chatData['communityId']?? '';
    state.communityProfile.value = chatData['communityProfile']?? '';
    state.communityName.value = chatData['communityName']?? '';
    state.participants.value = chatData['participantsList'] as List<ParticipantModel>;
    state.communityDescription.value = chatData['communityDescription'];
  }

  sendMessage() async {
    String sendContent = textController.text.trim();
    textController.clear();
    if(sendContent != ''){
      final content = CommunityChatModel(
        message: sendContent,
        sendBy: ParticipantModel(
          username: UserStore.to.profile.username,
          uid: UserStore.to.profile.uid,
          userProfile: UserStore.to.profile.photoId,
          userRole: 'participants'
        ),
        messageTm: DateTime.now(),
      );
      await FirebaseFireStore
          .to.sendCommunityMessage(
          content.toJson(), state.communityId.value
      ).then((value) {
        Get.focusScope?.unfocus();
      });
      log(content.messageTm.toIso8601String());
      await FirebaseFireStore.to.updateCommunityMessage(
          {
            "lastMessage": sendContent.trim(),
            "lastMessageBy": content.sendBy.uid,
            "lastMessageTm": content.messageTm.toIso8601String()
          },
          state.communityId.value
      );
    }
  }

  @override
  void onReady() {
    super.onReady();
    var messages = FirebaseFireStore.to.readCommunityMessage(state.communityId.value);
    state.chatData.clear();
    messages.listen((snapshot) {
      for (var change in snapshot.docChanges) {
        switch (change.type) {
          case DocumentChangeType.added :
            if (change.doc.data() != null) {
              state.chatData.insert(
                0,
                CommunityChatModel.fromJson(change.doc.data() as Map<String, Object?>),
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
    state.chatData.value = inReverse.toList() as List<CommunityChatModel>;
  }

  @override
  void dispose() {
    msgScrolling.dispose();
    super.dispose();
  }

}