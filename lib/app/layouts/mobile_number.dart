import 'package:flameloop/ContentStrings.dart';
import 'package:flameloop/MyTextStyles.dart';
import 'package:flameloop/app/Widgets/input_phone_number.dart';
import 'package:flameloop/app/routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class GetMobile_Screen extends GetView {
  const GetMobile_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StepProgressIndicator(
              totalSteps: 4,
              currentStep: 1,
              selectedColor: Colors.white,
              unselectedColor: Colors.white24,
            ),

            SizedBox(
              height: 20,
            ),

            // Welcome text with emoji
            Text(
              ContentStrings.getMobileScreenStr1,
              style: GoogleFonts.poppins(color: Colors.white60, fontSize: 15),
            ),

            // Enter your mobile number
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 13),
              child: Text(ContentStrings.getMobileScreenStr2,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700)),
            ),

            SizedBox(
              height: 20,
            ),

            input_phone_number(),

            SizedBox(
              height: 20,
            ),

            // GET OTP BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(RoutePaths.enter_Otp);
                  },
                  child: Text(
                    "Get OTP",
                    style: GoogleFonts.poppins(
                        color: Colors.black, fontWeight: FontWeight.w500),
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
