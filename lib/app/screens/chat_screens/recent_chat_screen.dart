import 'package:flameloop/app/routes/route_path.dart';
import 'package:flameloop/app/screens/chat_screens/getx_helper/chat_controller.dart';
import 'package:flameloop/app/screens/chat_screens/widgets/Chat_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/ThoughtBox.dart';

class RecentChatScreen extends GetView<ChatController> {
  const RecentChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primary
        ),
        automaticallyImplyLeading: false,
        title: const Text(
          "Messages",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size(
            MediaQuery.of(context).size.width,
            90.h,
          ),
          child: ThoughtBox()
        ),
        actions: [
          IconButton(onPressed: (){
            Get.toNamed(RoutePaths.availableUserScreen);

          }, icon: Icon(Icons.search_rounded))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: Column(
          children: [
            // Image.asset(
            //   "assets/messageScreen/image.png",
            //   height: 300,
            // ),
            // Text(
            //   ContentStrings.getMessageScreenStr1,
            //   style: GoogleFonts.poppins(
            //     color: Colors.white,
            //     fontSize: 17,
            //     fontWeight: FontWeight.w600,
            //   ),
            // ),
            // Text(
            //   ContentStrings.getMessageScreenStr2,
            //   style: GoogleFonts.poppins(
            //     color: Colors.white,
            //     fontSize: 13,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Get.toNamed(RoutePaths.startNewChatScreen);
            //   },
            //   child: Text(
            //     "Send a message",
            //     style: GoogleFonts.poppins(
            //       color: Theme.of(context).colorScheme.primary,
            //     ),
            //   ),
            // )
            Text(
              "Releated User",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
              ),
            ),
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
