import 'package:flutter/material.dart';

class ThoughtBubble extends StatelessWidget {
  const ThoughtBubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("assets/setupprofilescreen/avatar.png",),
            
          )
        ],
      ),
    );
  }
}
