import 'package:flameloop/app/models/enum/phone_auth_user_state.dart';
import 'package:flameloop/app/screens/auth_screens/getx_helper/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../utils/ContentStrings.dart';
import '../../widgets/get_otp_textfield.dart';
import '../../routes/route_path.dart';
import '../../services/user.dart';

class OtpVerificationScreen extends GetView<AuthController> {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.decrementSeconds();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const StepProgressIndicator(
              totalSteps: 4,
              currentStep: 2,
              selectedColor: Colors.white,
              unselectedColor: Colors.white24,
            ),

            // Content:  Hey
            SizedBox(
              height: 20.h,
            ),

            Text(
              ContentStrings.getOtpScreenStr1,
              style: GoogleFonts.poppins(color: Colors.white60, fontSize: 15.sp),
            ),
            SizedBox(
              height: 15.h,
            ),

            // Enter your otp here
            Text(ContentStrings.getOtpScreenStr2,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700)),

            SizedBox(
              height: 20.h,
            ),

            const GetOtpTextField(),

            SizedBox(
              height: 20.h,
            ),

            Obx(
              () => Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: ElevatedButton(
                    onPressed: () async {
                      if (!controller.isLoading.value &&
                          await controller.validateOtp()) {
                        if(UserStore.to.profile.userState == AuthUserState.newUser){
                          Get.toNamed(RoutePaths.setUpProfile);
                        }else{

                        }
                      }
                    },
                    child: !controller.isLoading.value
                        ? Text(
                            "Verify",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          )
                        : SizedBox(height: 15.h, width: 15.w,child: const CircularProgressIndicator())),
              ),
            ),

            // Content Line :Resend code
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                ContentStrings.getOtpScreenStr3,
                style: GoogleFonts.poppins(color: Colors.white60, fontSize: 15.sp),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Obx(
              () => Center(
                child: Text(
                  '${ContentStrings.resendOtp} ${controller.seconds.value} seconds',
                  style:
                      GoogleFonts.poppins(color: Colors.white60, fontSize: 15.sp),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                ContentStrings.getOtpScreenStr4,
                style: GoogleFonts.poppins(color: Colors.white60, fontSize: 12.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
