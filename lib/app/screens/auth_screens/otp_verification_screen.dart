import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../ContentStrings.dart';
import '../../Widgets/get_otp_textfield.dart';
import '../../routes/route_path.dart';

class OtpVerificationScreen extends GetView {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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

            // Hey text with emoji
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

            const Get_Otp_Textfield(),


            const SizedBox(
              height: 20,
            ),

            // Next BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(RoutePaths.setUpProfile);
                  },
                  child: Text(
                    "NEXT",
                    style: GoogleFonts.poppins(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  )),
            ),

            // Content Line :Resend code
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                ContentStrings.getOtpScreenStr3,
                style: GoogleFonts.poppins(color: Colors.white60, fontSize: 15),
              ),
            ),

            const SizedBox(height: 20,),


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
