import 'package:cached_network_image/cached_network_image.dart';
import 'package:flameloop/app/screens/chat_screens/getx_helper/recent_chat_helper/recent_chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/chat_room_model/chat_room_model.dart';
import '../../../services/user.dart';

class AvailableUserTile extends GetView<RecentChatController> {
  final int index;

  const AvailableUserTile({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        String chatRoomId = controller.generateChatRoomId(
            UserStore.to.uid, controller.users[index].uid);

        ChatRoomModel chatRoomModel = ChatRoomModel(
          users: [UserStore.to.uid, controller.users[index].uid],
          usersProfile: [
            UserStore.to.profile.photoId,
            controller.users[index].photoId
          ],
          usersName: [
            UserStore.to.profile.username,
            controller.users[index].username
          ],
          lastMessage: "",
          lastMessageBy: "",
          lastMessageTm: DateTime.now(),
          chatRoomId: chatRoomId,
        );
        controller.createChatRoom(chatRoomModel, controller.users[index]);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 2,
            )
          ],
        ),
        child: ListTile(
          leading: CircleAvatar(
            child: controller.users[index].photoId != '' ?
            CachedNetworkImage(
              imageUrl: controller.users[index].photoId,
              imageBuilder: (context, imageProvider){
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(44.r),
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover
                      )
                  ),
                );
              },
              errorWidget: (context, url, error){
                return Container();
              },
            ): CircleAvatar(
                radius: 25.r,
                backgroundImage: const AssetImage(
                  'assets/setupprofilescreen/avatar.png',
                )
            ),
          ),
          title: Text(
            controller.users[index].username,
            style: GoogleFonts.poppins(color: Colors.white),
          ),
          subtitle: Text(
            controller.users[index].aboutUser,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
