import 'package:flameloop/app/screens/chat_screens/widgets/Chat_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'getx_helper/chat_controller.dart';

class MessageScreen extends GetView<ChatController> {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Messages",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35)),
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
                  color: Colors.white, fontWeight: FontWeight.w500),
            ),
            Obx(
              () => !controller.isLoading.value
                  ? Expanded(
                      child: Container(
                        color: Theme.of(context).colorScheme.primary,
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
