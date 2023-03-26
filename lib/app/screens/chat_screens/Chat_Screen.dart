import 'package:flameloop/app/Widgets/Chat_input.dart';
import 'package:flutter/material.dart';

class Chat_Screen extends StatelessWidget {
  String userName;

  Chat_Screen({Key? key, required this.userName}) : super(key: key);

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
              Text("${userName}")
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
            Expanded(child: Center(child: Text("hi"))),

            ChatInput()
          ],
        ));
  }
}
