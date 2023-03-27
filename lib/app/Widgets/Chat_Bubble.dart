import 'package:flameloop/app/models/Chat_Bubble/Chat_Message.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatBubble extends StatelessWidget {
  ChatMessage chatMessageEntity;

  ChatBubble({Key? key, required this.chatMessageEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(12),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("${chatMessageEntity.text}",style: GoogleFonts.poppins(color: Colors.white),),
          ],
        ),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,

            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12))),
      ),
    );
  }
}
