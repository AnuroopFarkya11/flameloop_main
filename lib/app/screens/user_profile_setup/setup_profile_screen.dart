import 'dart:developer';

import 'package:flameloop/app/utils/ContentStrings.dart';
import 'package:flameloop/app/Widgets/input_textfields.dart';
import 'package:flameloop/app/routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class SetUpProfile extends GetView {
  const SetUpProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const StepProgressIndicator(
                  totalSteps: 4,
                  currentStep: 3,
                  selectedColor: Colors.white,
                  unselectedColor: Colors.white24,
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                    height: 110.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.asset(
                        "assets/setupprofilescreen/titlepage.png",
                        fit: BoxFit.cover,
                      ),
                    )),
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      ContentStrings.getSetUpProfileStr1,
                      style: GoogleFonts.poppins(
                          color: Colors.white60, fontSize: 15.sp),
                    ),

                    SizedBox(
                      height: 5.h,
                    ),

                    Text(
                      ContentStrings.getSetUpProfileStr2,
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700),
                    ),

                    SizedBox(
                      height: 20.h,
                    ),

                    //  IMAGE AVATAR
                    GestureDetector(
                      onTap: () {
                        log("Add photos");
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CircleAvatar(
                          radius: 40.r,
                          child: CircleAvatar(
                            radius: 40.r,
                            backgroundImage: const AssetImage(
                                "assets/setupprofilescreen/avatar.png"),
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                  size: 20.h,
                                )),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 30.h,
                    ),

                    const InputTextField(
                      labelText: 'Name',
                      inputType: "text",
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const InputTextField(
                      labelText: 'Email',
                      inputType: "text",
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    const InputTextField(
                      labelText: 'Something About you',
                      inputType: "text",
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        ContentStrings.getSetUpProfileStr3,
                        style: GoogleFonts.poppins(
                            color: Colors.white60, fontSize: 12.sp),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed(RoutePaths.selectInterest);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15.w),
              child: Text(
                "Complete Setup",
                style: GoogleFonts.poppins(color: Colors.black),
              ),
            ),
          ),
        ));
  }
}
