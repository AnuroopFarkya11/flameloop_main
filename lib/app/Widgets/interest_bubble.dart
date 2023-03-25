import 'dart:developer';

import 'package:flameloop/app/screens/user_profile_setup/getx_helper/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../models/interest_model/interest_model.dart';

class InterestTile extends GetView<SetProfileController> {
  final InterestModel interest;

  const InterestTile({Key? key, required this.interest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.selectSkills(interest);
      },
      child: Obx(
        () => Container(
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.w),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: controller.skillsSelected.contains(interest)
                    ? Colors.orange
                    : Colors.white,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                interest.icon,
                height: 20,
                width: 20,
              ),
              const SizedBox(
                width: 13,
              ),
              Text(interest.name)
            ],
          ),
        ),
      ),
    );
  }
}
