import 'package:cached_network_image/cached_network_image.dart';
import 'package:flameloop/app/models/community_model/community_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThoughtBubble extends StatelessWidget {
  final CommunityModel community;

  const ThoughtBubble({Key? key, required this.community}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
          CircleAvatar(
            radius: 34.r,
            child: community.communityIcon != ''
                ? CachedNetworkImage(
                    imageUrl: community.communityIcon,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(44.r),
                            border: Border.all(
                              width: 2,
                              color: Colors.black
                            ),
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                            ),
                        ),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Container();
                    },
                  )
                : CircleAvatar(
                    radius: 25.r,
                    backgroundImage: const AssetImage(
                      'assets/setupprofilescreen/avatar.png',
                    ),
                  ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            constraints: BoxConstraints(minWidth: 20.w, maxWidth: 100.h),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.r),
              child: Text(
                community.communityName,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
