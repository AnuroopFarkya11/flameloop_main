import 'package:flutter/material.dart';
class Chat_Screen extends StatelessWidget {
  String userName;
  Chat_Screen({Key? key,required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${userName}"),),
    );
  }
}
