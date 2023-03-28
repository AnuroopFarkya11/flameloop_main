import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/Thought_bubble.dart';

class ThoughtBox extends StatefulWidget {
  const ThoughtBox({Key? key}) : super(key: key);

  @override
  State<ThoughtBox> createState() => _ThoughtBoxState();
}

class _ThoughtBoxState extends State<ThoughtBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Row(
        children: [
          Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const ThoughtBubble();
                  },
              ))
        ],
      ),
    );
  }
}
