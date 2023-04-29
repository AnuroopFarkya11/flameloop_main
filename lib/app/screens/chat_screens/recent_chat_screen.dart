import 'package:flameloop/app/screens/chat_screens/getx_helper/recent_chat_helper/recent_chat_controller.dart';
import 'package:flameloop/app/screens/chat_screens/widgets/Chat_user.dart';
import 'package:flameloop/app/screens/chat_screens/widgets/CommunityWidgets/create_community.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../routes/route_path.dart';
import '../../widgets/Thought_bubble.dart';

class RecentChatScreen extends GetView<RecentChatController> {
  RecentChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "Messages",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  color: Colors.black),
            ),
            elevation: 0,
            backgroundColor: Colors.grey[200],
            bottom: PreferredSize(
              preferredSize: Size(
                MediaQuery.of(context).size.width,
                100.h,
              ),
              child: Obx(
                () => Container(
                  height: 100.h,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: !controller.loadingCommunity.value
                      ? Row(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: GestureDetector(
                                onTap: () {
                                  createCommunity(context);

                                },
                                child: SizedBox(
                                  // todo align it properly
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CircleAvatar(
                                        child: Icon(Icons.add),
                                        radius: 25.r,
                                      ),
                                      Container(
                                        constraints: BoxConstraints(
                                            minWidth: 20.w, maxWidth: 100.h),
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12.r),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.r),
                                          child: Text(
                                            "Add Community",
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    controller.state.communityList.length,
                                itemBuilder: (context, index) {
                                  return ThoughtBubble(
                                      community: controller
                                          .state.communityList[index]);
                                },
                              ),
                            ),
                          ],
                        )
                      : const CircularProgressIndicator(),
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Get.toNamed(RoutePaths.availableUserScreen);
                },
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r),
                ),
              ),
              child: Obx(
                () => Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.r),
                          topRight: Radius.circular(15.r),
                        ),
                      ),
                      child: Container(
                        width: 100.w,
                        height: 3.h,
                        margin: EdgeInsets.only(top: 15.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 15.w, left: 15.w),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                      child: Text(
                        'Recent Chats',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    controller.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : controller.state.chatRoomList.isNotEmpty
                            ? Obx(
                                () => ListView.builder(
                                  itemCount:
                                      controller.state.chatRoomList.length,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    if (controller
                                            .state.chatRoomList.isNotEmpty &&
                                        controller.state.otherUser.isNotEmpty) {
                                      var item =
                                          controller.state.chatRoomList[index];
                                      var otherUser =
                                          controller.state.otherUser[index];
                                      return ChatUser(
                                          item: item, otherUser: otherUser);
                                    } else {
                                      return const CircularProgressIndicator();
                                    }
                                  },
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.only(top: 80.h),
                                child: Column(
                                  children: [
                                    Lottie.asset('assets/no_recent_chat.json',
                                        height: 200.h, repeat: true),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text(
                                      'No Recent Chats',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 18.sp,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RoutePaths.availableUserScreen);
        },
        child: const Icon(Icons.chat),
      ),
    );
  }

  void nextScreen(context) {
    showModalBottomSheet(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),useSafeArea: true,isScrollControlled: true,context: context, builder: (context){
      return Expanded(child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(25)
          
          
        ),
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,color: Colors.white,)),

                Text(
                  textAlign: TextAlign.center,
                  "New community",
                  style:
                  GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight:
                      FontWeight
                          .w500,
                      color:
                      Colors.white),
                ),
                TextButton(onPressed:(){
                  Navigator.pop(context);

                  nextScreen(context);
                },child: Text("Create",style: TextStyle(color: Colors.white,fontSize: 14),)),


              ],
            ),
          ],
        ),
      ));
    });
  }
}
