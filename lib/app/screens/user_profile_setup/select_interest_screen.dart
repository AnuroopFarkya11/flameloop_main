import 'dart:developer';

import 'package:flameloop/app/Widgets/interest_bubble.dart';
import 'package:flameloop/app/models/interest_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/ContentStrings.dart';

class SelectInterest extends StatelessWidget {
  SelectInterest({Key? key}) : super(key: key);

  List<InterestClass> interestList = [
    InterestClass(interest_text: "Android", icon_path: "assets/interest_icons/android.png"),
    InterestClass(interest_text: "Flutter", icon_path: "assets/interest_icons/flutter.png"),
    InterestClass(interest_text: "Angular JS", icon_path: "assets/interest_icons/angularjs.png"),
    InterestClass(interest_text: "Css", icon_path: "assets/interest_icons/css.png"),
    InterestClass(interest_text: "Firebase", icon_path: "assets/interest_icons/firebase.png"),
    InterestClass(interest_text: "HTML", icon_path: "assets/interest_icons/html.png"),
    InterestClass(interest_text: "iOS", icon_path: "assets/interest_icons/ios.png"),
    InterestClass(interest_text: "JavaScript", icon_path: "assets/interest_icons/javascript.png"),
    InterestClass(interest_text: "React", icon_path: "assets/interest_icons/react.png"),
    InterestClass(interest_text: "Tail Wind", icon_path: "assets/interest_icons/tailwindcss-.png"),
    InterestClass(interest_text: "Word Press", icon_path: "assets/interest_icons/wordpress.png"),



  ];

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
            // i m interested in
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

            // Search box
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
            ),

            SizedBox(
              height: 20.h,
            ),

            // choices
            Expanded(
                child: Wrap(
                  runSpacing: 19,
              spacing: 10,
              children: List.generate(interestList.length, (index){
                return Interest_Bubble(interest_obj:interestList[index],);

              })
            ))
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            'Next',
            style: GoogleFonts.poppins(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
