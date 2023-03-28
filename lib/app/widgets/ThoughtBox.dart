import 'package:flutter/material.dart';

import 'Thought_bubble.dart';

class ThoughtBox extends StatefulWidget {
  const ThoughtBox({Key? key}) : super(key: key);

  @override
  State<ThoughtBox> createState() => _ThoughtBoxState();
}

class _ThoughtBoxState extends State<ThoughtBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        children: [
          Expanded(child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ThoughtBubble();

              }))
        ],
      ),
    );
  }
}
