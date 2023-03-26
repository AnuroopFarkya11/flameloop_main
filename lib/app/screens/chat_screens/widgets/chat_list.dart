import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../getx_helper/chat_space_helper/chat_space_library.dart';
import 'chat_left_item.dart';
import 'chat_right_item.dart';

// ignore: must_be_immutable
class ChatList extends GetView<ChatSpaceController> {
  ChatList({Key? key}) : super(key: key);
  String prevUserUid = '';

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => Container(
          padding: EdgeInsets.only( bottom: 15.h),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            reverse: true,
            itemCount: controller.state.chatData.length,
            itemBuilder: (context, index){
              var item = controller.state.chatData[index];
              final isSameUser = prevUserUid == item.sendBy;
              prevUserUid = item.sendBy;
              if(controller.state.toUserUid.value == item.sendBy){
                return chatRightItem(item, !isSameUser);
              }
              return chatLeftItem(item, !isSameUser);
            },
          ),
      ),
    );
  }
}
