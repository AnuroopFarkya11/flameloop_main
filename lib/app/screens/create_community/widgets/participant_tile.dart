import 'package:cached_network_image/cached_network_image.dart';
import 'package:flameloop/app/screens/create_community/getx_helper/create_community_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ParticipantTile extends GetView<CreateCommunityController> {
  const ParticipantTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => Container(
        color: Theme.of(context).colorScheme.primary,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.h),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Text(
                    '${controller.selectedUser.length} Users Selected',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                  )
                ],
              ),
            ),

            ListView.builder(
              itemCount: controller.users.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Obx(
                  () => Container(
                    margin: EdgeInsets.symmetric( vertical: 5.h ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: controller.selectionTrace[index]? Colors.orangeAccent : Colors.grey[300]!,
                        width: controller.selectionTrace[index]? 3.w : 2.w
                      )
                    ),
                    child: ListTile(
                      onTap: () {
                        controller.selectionTrace[index] = !controller.selectionTrace[index];
                        controller.maintainSelection(controller.users[index]);
                      },
                      leading: CircleAvatar(
                        radius: 30.r,
                        child: controller.users[index].photoId != ''
                            ? CachedNetworkImage(
                                imageUrl: controller.users[index].photoId,
                                imageBuilder: (context, imageProvider) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  );
                                },
                                errorWidget: (context, url, error) {
                                  return Container();
                                },
                              )
                            : CircleAvatar(
                                radius: 35.r,
                                backgroundImage: const AssetImage(
                                  'assets/setupprofilescreen/avatar.png',
                                ),
                              ),
                      ),
                      title: SizedBox(
                        width: 200.w,
                        child: Text(
                          controller.users[index].username,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      subtitle: SizedBox(
                        width: 200.w,
                        child: Text(
                          controller.users[index].aboutUser,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
