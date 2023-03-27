import 'package:cached_network_image/cached_network_image.dart';
import 'package:flameloop/app/screens/chat_screens/widgets/Chat_input.dart';
import 'package:flameloop/app/screens/chat_screens/widgets/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'getx_helper/chat_space_helper/chat_space_library.dart';

class ChatSpace extends GetView<ChatSpaceController> {
  const ChatSpace({Key? key}) : super(key: key);

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
              CircleAvatar(
                child: CachedNetworkImage(
                  imageUrl: controller.state.toUserProfile.value,
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
                  },
                ),
              ),
            ],
          ),
          title: Text(
            controller.state.toUserName.value,
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
            child: ChatList(),
          ),
          const ChatInput()
        ],
      ),
    );
  }
}
