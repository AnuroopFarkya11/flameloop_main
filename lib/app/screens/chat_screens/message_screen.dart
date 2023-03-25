import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flameloop/app/utils/ContentStrings.dart';
import 'package:flameloop/app/utils/MyTextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../routes/route_path.dart';

class Message_Screen extends GetView {
  Message_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Messages",style: TextStyle(color: Colors.black),),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35)),
        ),

        child: Center(
          child: Column(
            children: [
              Image.asset("assets/messageScreen/image.png",height: 300,),

              Text("${ContentStrings.getMessageScreenStr1}",style: GoogleFonts.poppins(color: Colors.white,fontSize: 17,fontWeight:FontWeight.w600),),
              Text("${ContentStrings.getMessageScreenStr2}",style: GoogleFonts.poppins(color: Colors.white,fontSize: 13,),textAlign: TextAlign.center,),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){

                Get.toNamed(RoutePaths.startNewChatScreen);

              }, child: Text("Send a message",style: GoogleFonts.poppins(color: Theme.of(context).colorScheme.primary),))


            ],
          ),
        )
      ),
    );
  }
}
