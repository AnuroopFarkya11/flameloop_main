import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThoughtBubble extends StatelessWidget {
  const ThoughtBubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 100.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundImage: const AssetImage(
                  "assets/setupprofilescreen/avatar.png",
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "User",
                style: GoogleFonts.poppins(),
              ),
            ],
          ),
          Container(
            constraints: BoxConstraints(minWidth: 20.w, maxWidth: 70.h),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(12.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.r),
              child: const Text(
                'Hii! I am anuroop',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
