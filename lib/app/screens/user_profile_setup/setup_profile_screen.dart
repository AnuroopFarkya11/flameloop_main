import 'dart:io';

import 'package:flameloop/app/Widgets/input_textfields.dart';
import 'package:flameloop/app/routes/route_path.dart';
import 'package:flameloop/app/screens/user_profile_setup/getx_helper/controller.dart';
import 'package:flameloop/app/utils/ContentStrings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class SetUpProfile extends GetView<SetProfileController> {
  SetUpProfile({Key? key}) : super(key: key);

  final formKey1 = GlobalKey<FormState>();
  // final formKey2 = GlobalKey<FormState>();
  // final formKey3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey1,
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
                    ),
                  ),
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
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      SizedBox(
                        height: 20.h,
                      ),

                      //  IMAGE AVATAR
                      GestureDetector(
                        onTap: () async {
                          final image = await ImagePicker().pickImage(
                            source: ImageSource.gallery,
                          );
                          if (image != null) {
                            controller.imagePath.value = image.path;
                          }
                        },
                        child: Obx(
                          () => Align(
                            alignment: Alignment.centerLeft,
                            child: controller.imagePath.value == ''
                                ? CircleAvatar(
                                    radius: 45,
                                    backgroundImage: const AssetImage(
                                        'assets/setupprofilescreen/avatar.png'),
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Icon(
                                        Icons.add_circle,
                                        color: Colors.white,
                                        size: 23.h,
                                      ),
                                    ),
                                  )
                                : CircleAvatar(
                                    radius: 45,
                                    backgroundImage: FileImage(
                                        File(controller.imagePath.value)),
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Icon(
                                        Icons.add_circle,
                                        color: Colors.white,
                                        size: 23.h,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),

                      InputTextField(
                        labelText: 'Name',
                        inputType: "text",
                        controller: controller.nameController,
                        // formKey: formKey1,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      InputTextField(
                        labelText: 'Email',
                        inputType: "text",
                        controller: controller.emailController,
                        // formKey: formKey2,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      InputTextField(
                        labelText: 'Something About you',
                        inputType: "text",
                        controller: controller.aboutController,
                        // formKey: formKey3,
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
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
          child: ElevatedButton(
            onPressed: () async {
              if (formKey1.currentState!.validate() ){
                await controller.saveUserData();
                Get.toNamed(RoutePaths.selectInterest);
              }
            },
            child: Container(
              // alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 12.w),
              child: Obx(
                () => controller.isSaving.value
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator())
                    : Text(
                        "Complete Setup",
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 16),
                      ),
              ),
            ),
          ),
        ));
  }
}
