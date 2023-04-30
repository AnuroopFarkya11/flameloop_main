import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flameloop/app/screens/chat_screens/community_chat_space/widgets/UserTile.dart';
import 'package:flameloop/app/screens/chat_screens/getx_helper/chat_space_helper/chat_space_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../getx_helper/community_chat_helper/community_chat_space_controller.dart';


class UserDetails extends GetView<ChatSpaceController> {
  UserDetails({Key? key}) : super(key: key);






  @override
  Widget build(BuildContext context) {

  Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        // leading: Icon(Icons.arrow_back),
        centerTitle: true,
        title: Text(
          "User Info",
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 16.sp),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Edit",
                style: GoogleFonts.poppins(color: Colors.white),
              )
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: size.height,
          color: Theme.of(context).colorScheme.primary,
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),

              // Community profile
              Center(
                child: controller.state.toUserProfile.value != '' ?
                CircleAvatar(
                  radius: 90.r,
                  child: CachedNetworkImage(
                      imageUrl: controller.state.toUserProfile.value,
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90.r),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return Container();
                      }),
                )
                    : CircleAvatar(
                  radius: 90.r,
                  backgroundImage: const AssetImage(
                    'assets/setupprofilescreen/avatar.png',
                  ),
                ),

              ),

              SizedBox(
                height: 20.h,
              ),

              // User Name
              Container(
                  constraints: BoxConstraints(
                      // TODO Name ka constraint
                      maxWidth: size.width * 0.6),
                  child: Text(
                    controller.state.toUserName.string==""?"User Name":controller.state.toUserName.string,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 22.sp, fontWeight: FontWeight.w700,color: Colors.white),
                  ),

              ),

              SizedBox(
                height: 20.h,
              ),

              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(12.w),
                constraints: BoxConstraints(
                  minHeight: 50.h,
                  minWidth: size.width,
                  maxWidth: size.width,

                ),
                decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(15)
                ),
                // todo if description is empty
                child: Text(
                  controller.state.toUserDescription.string==""?".":controller.state.toUserDescription.string,
                  style: GoogleFonts.poppins(fontSize: 15.sp),
                ),
              ),

              SizedBox(height: 20.h,),

              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.exit_to_app,color: Colors.red,),
                        SizedBox(width: 20,),
                        Text("Block ${controller.state.toUserName}",style: GoogleFonts.poppins(color: Colors.red),)
                      ],
                    ),
                    // SizedBox(height: 0,),
                    Divider(color: Colors.black,),
                    Row(
                      children: [
                        Icon(Icons.exit_to_app,color: Colors.red,),
                        SizedBox(width: 20,),
                        Text("Report ${controller.state.toUserName}",style: GoogleFonts.poppins(color: Colors.red),)
                      ],
                    )
                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
