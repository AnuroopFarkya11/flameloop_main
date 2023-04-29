import 'package:flameloop/app/screens/create_community/widgets/participant_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'getx_helper/create_community_controller.dart';

addParticipants(context) {
  final controller = Get.find<CreateCommunityController>();
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    builder: (context) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(25),
          ),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Add Participants",
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // addParticipants(context);
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,

                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Obx(
              () => !controller.loadingUser.value
                  ? const Expanded(
                      child: ParticipantTile(),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
            )
          ],
        ),
      );
    },
  );
}
