import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/ContentStrings.dart';

class SelectInterest extends StatelessWidget {
  const SelectInterest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                  fontSize: 25.sp,
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
                      ))),
            )
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 15.w),
        child: ElevatedButton(onPressed: (){},child: Text('Next',style: GoogleFonts.poppins(color: Colors.black),),),
      ),

    );
  }
}
