import 'dart:developer';

import 'package:flameloop/app/Widgets/Chat_Bubble.dart';
import 'package:flameloop/app/Widgets/Chat_input.dart';
import 'package:flutter/material.dart';

import '../../models/Chat_Bubble/Chat_Message.dart';

class Chat_Screen extends StatefulWidget {
  String userName;

  Chat_Screen({Key? key, required this.userName}) : super(key: key);

  @override
  State<Chat_Screen> createState() => _Chat_ScreenState();
}

class _Chat_ScreenState extends State<Chat_Screen> {
  // todo fetch list from firebase
  List<ChatMessage> Message_list = [];

  void addMessageOnSubmit(ChatMessage chatMessageEntity) {
    if(chatMessageEntity.text.isNotEmpty) {
      setState(() {
        Message_list!.add(chatMessageEntity);
        log("New Message + ${chatMessageEntity.text}");
      });
    }
    // Message_list.add(chatMessageEntity);

    // log("New Message + ${chatMessageEntity.text} ${Message_list.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                child: Icon(Icons.person),
              ),
              SizedBox(
                width: 20,
              ),
              Text("${widget.userName}")
            ],
          ),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.more_vert),
                )),
          ],
        ),
        body: Column(
    children: [
    Expanded(child: ListView.builder(itemCount:Message_list.length,
        itemBuilder: (context, index) {
          return ChatBubble(chatMessageEntity: Message_list[index]);
        })),
    ChatInput(
    addMessage: addMessageOnSubmit,
    )
    ],
    )
    );
  }
}
