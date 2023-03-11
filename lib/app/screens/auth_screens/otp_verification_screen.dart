import 'package:flameloop/app/models/enum/phone_auth_user_state.dart';
import 'package:flameloop/app/screens/auth_screens/getx_helper/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../ContentStrings.dart';
import '../../Widgets/get_otp_textfield.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
            const SizedBox(
              height: 20,
            ),

            Text(
              ContentStrings.getOtpScreenStr1,
              style: GoogleFonts.poppins(color: Colors.white60, fontSize: 15),
            ),
            const SizedBox(
              height: 15,
            ),

            // Enter your otp here
            Text(ContentStrings.getOtpScreenStr2,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w700)),

            const SizedBox(
              height: 20,
            ),

            const GetOtpTextField(),

            const SizedBox(
              height: 20,
            ),

            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                    onPressed: () async {
                      if (!controller.isLoading.value &&
                          await controller.validateOtp()) {
                        if(UserStore.to.profile.userState == AuthUserState.newUser){
                          Get.toNamed(RoutePaths.setUpProfile);
                        }else{
                          // Get.toNamed(RoutePaths.setUpProfile);
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
                        : const SizedBox(height: 20, width: 20,child: CircularProgressIndicator())),
              ),
            ),

            // Content Line :Resend code
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                ContentStrings.getOtpScreenStr3,
                style: GoogleFonts.poppins(color: Colors.white60, fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => Center(
                child: Text(
                  '${ContentStrings.resendOtp} ${controller.seconds.value} seconds',
                  style:
                      GoogleFonts.poppins(color: Colors.white60, fontSize: 15),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                ContentStrings.getOtpScreenStr4,
                style: GoogleFonts.poppins(color: Colors.white60, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
