import 'package:flameloop/ContentStrings.dart';
import 'package:flameloop/app/routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStarted extends StatelessWidget{
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 30.h, left: 20.w, right: 20.w),
              child: Text(
                ContentStrings.getStartedstr1,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 20.h, right: 20.w, bottom: 40.h),
              child: Text(
                ContentStrings.getStartedstr2,
                style:
                    GoogleFonts.poppins(color: const Color(0xffBDBCBC), fontSize: 15.sp),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10.w),
                child: Image.asset("assets/getstartedscreen/gettry.png")),

            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.h),
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(RoutePaths.mobileAuthScreen);
          },
          child: const Text(
            "Get Started",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
