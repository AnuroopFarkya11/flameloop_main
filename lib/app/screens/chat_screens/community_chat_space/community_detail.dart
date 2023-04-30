import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flameloop/app/screens/chat_screens/community_chat_space/widgets/UserTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../getx_helper/community_chat_helper/community_chat_space_controller.dart';


class CommunityDetails extends GetView<CommunityChatSpaceController> {
  CommunityDetails({Key? key}) : super(key: key);






  @override
  Widget build(BuildContext context) {

  Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        // leading: Icon(Icons.arrow_back),
        centerTitle: true,
        title: Text(
          "Community Info",
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 16.sp),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Edit",
                style: GoogleFonts.poppins(),
              )
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: size.height,
          color: Colors.white,
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),

              // Community profile
              Center(
                child: controller.state.communityProfile.value != '' ?
                CircleAvatar(
                  radius: 90.r,
                  child: CachedNetworkImage(
                      imageUrl: controller.state.communityProfile.value,
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
                // child: CircleAvatar(
                //   backgroundColor: Colors.transparent,
                //   backgroundImage: Image.asset(
                //     "assets/addCommunity/takepicture.png",
                //     fit: BoxFit.fill,
                //   ).image,
                //   radius: 90,
                // ),
              ),

              SizedBox(
                height: 20.h,
              ),

              // Community Name
              Container(
                  constraints: BoxConstraints(
                      // TODO Name ka constraint
                      maxWidth: size.width * 0.6),
                  child: Text(
                    controller.state.communityName.string==""?"Community Name":controller.state.communityName.string,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 22.sp, fontWeight: FontWeight.w700),
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
                  // maxHeight: size.width*0.5
                ),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(15)
                ),
                // todo if description is empty
                child: Text(
                  controller.state.communityDescription.string==""?"Add Description":controller.state.communityDescription.string,
                  style: GoogleFonts.poppins(),
                ),
              ),

              SizedBox(
                height: 20.h,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${controller.state.participants.length} Participants",
                        style: GoogleFonts.poppins(
                            fontSize: 16.sp, fontWeight: FontWeight.w600),
                      )
                  ),
                  CircleAvatar(
                      backgroundColor: Colors.black12,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            color: Colors.black,
                          )
                      )
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(

                constraints: BoxConstraints(
                  // minHeight: ,
                  maxHeight: size.height*0.5
                ),

                // padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: controller.state.participants.length,
                  itemBuilder: (context, index) {
                    return UserTile(participant:controller.state.participants[index]);
                  },
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
                        Text("Exit Community",style: GoogleFonts.poppins(color: Colors.red),)
                      ],
                    ),
                    // SizedBox(height: 0,),
                    Divider(color: Colors.black,),
                    Row(
                      children: [
                        Icon(Icons.exit_to_app,color: Colors.red,),
                        SizedBox(width: 20,),
                        Text("Delete Community",style: GoogleFonts.poppins(color: Colors.red),)
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
