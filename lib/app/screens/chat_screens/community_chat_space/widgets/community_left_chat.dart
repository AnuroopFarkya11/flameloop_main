import 'package:flameloop/app/models/community_chat_model/community_chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/date.dart';

Widget communityChatLeftItem(CommunityChatModel item, bool isSameUser){
  return Container(
    padding: EdgeInsets.symmetric( horizontal: 8.w),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric( horizontal: 5.w, vertical: 0.h),
          child: item.sendBy.userProfile != '' ?
          CircleAvatar(
              radius: 13.r,
              backgroundImage: NetworkImage(
                item.sendBy.userProfile,
              )
          ): CircleAvatar(
              radius: 13.r,
              backgroundImage: const AssetImage(
                'assets/setupprofilescreen/avatar.png',
              )
          ),
        ),
        Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                bottom: 13.w,
                top: 5.w,
                right: 35.w,
                left: 12.w,
              ),
              margin: EdgeInsets.symmetric(vertical: 3.w),
              constraints: BoxConstraints(
                maxWidth: 230.w,
                maxHeight: 1500.w,
              ),
              decoration: BoxDecoration(
                  color: const Color(0xff005F99),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2.r),
                    bottomRight: Radius.circular(15.r),
                    bottomLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4.r,
                        offset: const Offset(0,2)
                    )
                  ]
              ),
              child: Text(
                item.message,
                textAlign: TextAlign.start,
                maxLines: 10,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 13.sp,
                    color: Colors.white
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Positioned(
              bottom: 6.h,
              right: 10.w,
              child: Text(
                '${timeFormatted(item.messageTm).hour}: ${timeFormatted(item.messageTm).minute}' ,
                style: GoogleFonts.poppins(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
