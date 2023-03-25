import 'dart:developer';

import 'package:flameloop/app/Widgets/interest_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/ContentStrings.dart';
import 'getx_helper/controller.dart';

class SelectInterest extends GetView<SetProfileController> {
  const SelectInterest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              ContentStrings.getSelectCatedoriesStr1,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextField(
              cursorColor: Colors.black,
              style: GoogleFonts.poppins(color: Colors.black),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: "Search Categories",
                hintStyle: GoogleFonts.poppins(),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: Wrap(
                runSpacing: 19,
                spacing: 19,
                alignment: WrapAlignment.center,
                children:
                    List.generate(controller.interestList.length, (index) {
                  return InterestTile(interest: controller.interestList[index]);
                }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
        child: ElevatedButton(
          onPressed: () {},
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Text(
              'Next',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 16
              ),
            ),
          ),
        ),
      ),
    );
  }
}
