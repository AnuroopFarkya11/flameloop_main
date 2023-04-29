import 'package:flameloop/app/routes/route_path.dart';
import 'package:flameloop/app/screens/auth_screens/getx_helper/controller/auth_controller.dart';
import 'package:flameloop/app/utils/ContentStrings.dart';
import 'package:flameloop/app/widgets/input_phone_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class MobileAuthScreen extends GetView<AuthController> {
  const MobileAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        toolbarHeight: 20.h,
        backgroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const StepProgressIndicator(
              totalSteps: 4,
              currentStep: 1,
              selectedColor: Colors.white,
              unselectedColor: Colors.white24,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              ContentStrings.getMobileScreenStr1,
              style:
                  GoogleFonts.poppins(color: Colors.white60, fontSize: 15.sp),
            ),
            SizedBox(
              height: 13.h,
            ),

            // Enter your mobile number
            Text(
              ContentStrings.getMobileScreenStr2,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(
              height: 30.h,
            ),

            const InputPhoneNumber(),
            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.w),
              child: ElevatedButton(
                onPressed: () async {
                  if (controller.validate()) {
                    await controller.handleSignInByPhone();
                    Get.toNamed(RoutePaths.otpVerificationScreen);
                  } else {
                    Get.snackbar(
                      "Mobile Auth",
                      "Please Enter a valid phone number",
                      snackStyle: SnackStyle.FLOATING,
                      icon: const Icon(
                        Icons.person,
                        color: Color(0xff28282B),
                      ),
                      snackPosition: SnackPosition.BOTTOM,
                      dismissDirection: DismissDirection.horizontal,
                      backgroundColor: Colors.grey[200],
                      borderRadius: 10.r,
                      margin: EdgeInsets.all(10.w),
                      padding: EdgeInsets.all(15.w),
                      colorText: const Color(0xff28282B),
                      duration: const Duration(seconds: 4),
                      isDismissible: true,
                      forwardAnimationCurve: Curves.easeOutBack,
                    );
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15.w),
                  child: Text(
                    "Get OTP",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
            ),

            // Content Line
            Center(
              child: Text(
                ContentStrings.getMobileScreenStr3,
                style:
                    GoogleFonts.poppins(color: Colors.white60, fontSize: 15.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
