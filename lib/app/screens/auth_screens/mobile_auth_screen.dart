import 'package:flameloop/ContentStrings.dart';
import 'package:flameloop/app/Widgets/input_phone_number.dart';
import 'package:flameloop/app/routes/route_path.dart';
import 'package:flameloop/app/screens/auth_screens/getx_helper/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const StepProgressIndicator(
              totalSteps: 4,
              currentStep: 1,
              selectedColor: Colors.white,
              unselectedColor: Colors.white24,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              ContentStrings.getMobileScreenStr1,
              style: GoogleFonts.poppins(color: Colors.white60, fontSize: 15),
            ),
            const SizedBox(
              height: 13,
            ),

            // Enter your mobile number
            Text(ContentStrings.getMobileScreenStr2,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w700)),

            const SizedBox(
              height: 30,
            ),

            const InputPhoneNumber(),
            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                  onPressed: () async {
                    if (controller.validate()) {
                      await controller.handleSignInByPhone();
                      Get.toNamed(RoutePaths.otpVerificationScreen);
                    } else {
                      Fluttertoast.showToast(
                          msg: "Enter a valid Phone Number",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 3,
                          backgroundColor: Colors.grey[300],
                          textColor: Colors.black,
                          fontSize: 16.0);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "Get OTP",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  )),
            ),

            // Content Line
            Center(
              child: Text(
                ContentStrings.getMobileScreenStr3,
                style: GoogleFonts.poppins(color: Colors.white60, fontSize: 15),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
