import 'package:cached_network_image/cached_network_image.dart';
import 'package:flameloop/app/screens/chat_screens/widgets/Chat_input.dart';
import 'package:flameloop/app/screens/chat_screens/widgets/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../getx_helper/community_chat_helper/community_chat_space_controller.dart';
import '../community_chat_list.dart';


class CommunityChatSpace extends GetView<CommunityChatSpaceController> {
  const CommunityChatSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ListTile(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              controller.state.communityProfile.value != '' ?
              CircleAvatar(
                child: CachedNetworkImage(
                    imageUrl: controller.state.communityProfile.value,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(44.r),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Container();
                    }),
              )
                  : CircleAvatar(
                radius: 22.r,
                backgroundImage: const AssetImage(
                  'assets/setupprofilescreen/avatar.png',
                ),
              )
            ],
          ),
          title: Text(
            controller.state.communityName.value,
            style: GoogleFonts.poppins(color: Colors.white),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.more_vert),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: CommunityChatList(),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff1e1e20),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.r),
                topLeft: Radius.circular(10.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add, color: Colors.white),
                    ),
                    Expanded(
                      child: TextField(
                        cursorColor: Colors.white,
                        minLines: 1,
                        controller: controller.textController,
                        maxLines: 5,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.sp
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type your message',
                          hintStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.sendMessage();
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
