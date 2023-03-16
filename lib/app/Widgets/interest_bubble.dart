import 'dart:developer';

import 'package:flutter/material.dart';

import '../models/interest_model.dart';
class Interest_Bubble extends StatefulWidget {

  InterestClass interest_obj;

  Interest_Bubble({Key? key, required this.interest_obj}) : super(key: key);

  @override
  State<Interest_Bubble> createState() => _Interest_BubbleState();
}

class _Interest_BubbleState extends State<Interest_Bubble> {


  late Color color= Colors.white;

  // TODO
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("Interest CLicked : " + widget.interest_obj.interest_text);
        setState(() {
          color= color==Colors.white?Colors.blue:Colors.white;
        });
      },
      child: Container(
        height: 30,
        width: widget.interest_obj.interest_text.length<5?100:120,

        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("${widget.interest_obj.icon_path}"),
            Text("${widget.interest_obj.interest_text}")
          ],
        ),
      ),
    );
  }
}
