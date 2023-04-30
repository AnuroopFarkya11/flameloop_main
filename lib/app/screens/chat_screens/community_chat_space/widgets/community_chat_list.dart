import 'package:flameloop/app/screens/chat_screens/community_chat_space/widgets/community_right_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../services/user.dart';
import '../../getx_helper/community_chat_helper/community_chat_space_controller.dart';
import 'community_left_chat.dart';

// ignore: must_be_immutable
class CommunityChatList extends GetView<CommunityChatSpaceController> {
  CommunityChatList({Key? key}) : super(key: key);
  String prevUserUid = '';

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.only(bottom: 15.h),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          reverse: true,
          itemCount: controller.state.chatData.length,
          itemBuilder: (context, index) {
            var item = controller.state.chatData[index];
            final isSameUser = prevUserUid == item.sendBy.uid;
            prevUserUid = item.sendBy.uid;
            if (UserStore.to.uid == item.sendBy.uid) {
              return communityChatRightItem(item, !isSameUser);
            }
            return communityChatLeftItem(item, !isSameUser);
          },
        ),
      ),
    );
  }
}
