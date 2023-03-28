import 'package:flameloop/app/screens/chat_screens/getx_helper/chat_controller.dart';
import 'package:flameloop/app/screens/chat_screens/widgets/Chat_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentChatScreen extends GetView<ChatController> {
  const RecentChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Messages",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
              color: Colors.black
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.grey[100],
        bottom: PreferredSize(
          preferredSize: Size(
            MediaQuery.of(context).size.width,
            80.h,
          ),
          child: Container(
            color: Colors.blueAccent,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.r),
            topRight: Radius.circular(15.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 100.w,
                height: 3.h,
                decoration: BoxDecoration(
                  color: Colors.white
                ),
              ),
            ),
            // Image.asset(
            //   "assets/messageScreen/image.png",
            //   height: 300,
            // ),
            Obx(
              () => !controller.isLoading.value
                  ? Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: ListView.builder(
                          itemCount: controller.users.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ChatUser(index: index);
                          },
                        ),
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
