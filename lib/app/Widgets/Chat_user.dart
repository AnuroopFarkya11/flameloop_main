import 'package:flameloop/app/routes/route_path.dart';
import 'package:flameloop/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatUser extends GetView {
  int index;

  ChatUser({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        //TODO PASS ARGUMENT USING USER MODEL
        print("CLicked:${index}");
        Get.toNamed(RouteClass.getChatScreen());
      },
      child: Container(
        margin: EdgeInsets.all(1.0),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text(
            "User${index}",
            style: GoogleFonts.poppins(color: Colors.white),
          ),
          subtitle: Text(
            "@user${index}",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
