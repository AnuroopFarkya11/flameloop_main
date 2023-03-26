import 'package:flameloop/app/screens/chat_screens/getx_helper/chat_space_helper/chat_space_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatInput extends GetView<ChatSpaceController> {
  const ChatInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
