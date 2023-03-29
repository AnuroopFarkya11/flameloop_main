import 'package:flameloop/app/screens/chat_screens/getx_helper/chat_controller.dart';
import 'package:flameloop/app/screens/chat_screens/widgets/Chat_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'widgets/ThoughtBox.dart';

class RecentChatScreen extends GetView<ChatController> {
  const RecentChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "Messages",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  color: Colors.black),
            ),
            elevation: 0,
            backgroundColor: Colors.grey[200],
            bottom: PreferredSize(
                preferredSize: Size(
                  MediaQuery.of(context).size.width,
                  90.h,
                ),
                child: const ThoughtBox()),
          ),
          SliverToBoxAdapter(
            child: Obx(
              () => !controller.isLoading.value
                  ? Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.r),
                          topRight: Radius.circular(15.r),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.r),
                                topRight: Radius.circular(15.r),
                              ),
                            ),
                            child: Container(
                              width: 100.w,
                              height: 3.h,
                              margin: EdgeInsets.only(top: 15.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40.r),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(top: 15.w, left: 15.w),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(40.r),
                            ),
                            child: Text(
                              'Recent Chats',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                          controller.users.isNotEmpty
                              ? ListView.builder(
                                  itemCount: controller.users.length,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return const ChatUser(index: 0);
                                  },
                                )
                              : Container(
                                  margin: EdgeInsets.only(top: 80.h),
                                  child: Column(
                                    children: [
                                      Lottie.asset('assets/no_recent_chat.json',
                                          height: 200.h, repeat: true),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Text(
                                        'No Recent Chats',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 18.sp,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
    );
  }
}
