import 'package:flameloop/app/models/community_chat_model/community_chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/date.dart';


Widget communityChatRightItem(CommunityChatModel item, bool isSameUser){
  return Container(
    padding: EdgeInsets.symmetric( horizontal: 10.w, vertical: 2.h),
    alignment: Alignment.topRight,
    child: Stack(
      children: [
        Container(
          // padding: EdgeInsets.only(top: 5.w, bottom: 14.w, right: 8.w, left: 13.w),
          constraints: BoxConstraints(
            maxWidth: 230.w,
            maxHeight: 1500.w,
          ),
          padding: EdgeInsets.only(
            bottom: 13.w,
            top: 5.w,
            right: 35.w,
            left: 12.w,
          ),
          decoration: BoxDecoration(
            color: const Color(0xff00C2CB),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                bottomLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
                bottomRight: Radius.circular(2.r)
            ),
          ),
          child:  Text(
            item.message,
            maxLines: 10,
            textAlign: TextAlign.justify,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child: Text(
            '${timeFormatted(item.messageTm).hour}: ${timeFormatted(item.messageTm).minute}' ,
            style: GoogleFonts.poppins(
              fontSize: 11.sp,
              fontWeight: FontWeight.w400,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
