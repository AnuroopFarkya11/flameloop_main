import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_Participitants.dart';
import 'getx_helper/create_community_controller.dart';

createCommunity(context) {
  final controller = Get.put(CreateCommunityController());
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    isScrollControlled: true,
    useSafeArea: true,
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: Obx(
            () => Container(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 35.h
              ),
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: !controller.posting.value ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.selectedUser.clear();
                          controller.selectionTrace.clear();
                          controller.communityLogo.value = '';
                          controller.communityNameController.text = '';
                          controller.communityDescController.text = '';
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "New community",
                        style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          await controller.createCommunity();
                          controller.selectedUser.clear();
                          controller.selectionTrace.clear();
                          controller.communityLogo.value = '';
                          controller.communityNameController.text = '';
                          controller.communityDescController.text = '';
                          Get.back();
                        },
                        child: Text(
                          "Create",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  // image picker
                  GestureDetector(
                    onTap: () {
                      controller.pickImageDialog(context);
                    },
                    child: Obx(
                          () =>
                          CircleAvatar(
                            // child: Icon(Icons.camera, size: 30),
                            backgroundImage: controller.communityLogo.value == ""
                                ? Image.asset("assets/addCommunity/takepicture.png", fit: BoxFit.fitWidth,).image
                                : Image.file(File(controller.communityLogo.value)).image,
                            backgroundColor: Colors.transparent,
                            radius: 70.r,
                            child: const Align(
                              alignment: Alignment.bottomRight,
                              child: Icon(
                                Icons.add_circle,
                                color: Colors.white,
                                size: 32.0,
                              ),
                            ),
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: controller.communityNameController,
                    style: const TextStyle(
                        color: Colors.white
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white24,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      hintText: "Community Name",
                      hintStyle: GoogleFonts.poppins(color: Colors.white30),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: controller.communityDescController,
                    style: const TextStyle(
                        color: Colors.white
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white24,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Community Description",
                      hintStyle: GoogleFonts.poppins(color: Colors.white30),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Obx(
                        () =>
                        Container(
                          color: Theme.of(context).colorScheme.primary,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 5.h),
                                padding: EdgeInsets.symmetric(horizontal: 10.w,
                                    vertical: 10.h),
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: Text(
                                  '${controller.selectedUser.length} Users Selected',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              ListView.builder(
                                itemCount: controller.selectedUser.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                        () =>
                                        Container(
                                          margin: EdgeInsets.symmetric(vertical: 5.h),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.r),
                                            border: Border.all(
                                              color: Colors.grey[300]!,
                                            ),
                                          ),
                                          child: ListTile(
                                            leading: CircleAvatar(
                                              radius: 30.r,
                                              child: controller.selectedUser[index].photoId != '' ?
                                              CachedNetworkImage(
                                                imageUrl: controller.selectedUser[index].photoId,
                                                imageBuilder: (context, imageProvider) {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                errorWidget: (context, url,
                                                    error) {
                                                  return Container();
                                                },
                                              )
                                                  : CircleAvatar(
                                                radius: 35.r,
                                                backgroundImage: const AssetImage(
                                                  'assets/setupprofilescreen/avatar.png',
                                                ),
                                              ),
                                            ),
                                            title: SizedBox(
                                              width: 200.w,
                                              child: Text(
                                                controller.selectedUser[index]
                                                    .username,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            subtitle: SizedBox(
                                              width: 200.w,
                                              child: Text(
                                                controller.selectedUser[index].aboutUser,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.loadUsers();
                      addParticipants(context);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 5.w),
                      alignment: Alignment.center,
                      child: Text(
                        "Add Participants",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ) : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                  SizedBox(height: 20.h,),
                  Text(
                    'Creating Your Community',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white
                    ),
                  )
                ],
              ),
          ),
        ),
      );
    },
  );
}
