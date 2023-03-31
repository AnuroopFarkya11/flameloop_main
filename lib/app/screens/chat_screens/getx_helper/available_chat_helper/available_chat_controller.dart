// import 'dart:developer';
//
// import 'package:flameloop/app/screens/chat_screens/available_users.dart';
// import 'package:get/get.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
//
// import '../../../../models/chat_room_model/chat_room_model.dart';
// import '../../../../models/users/user_model.dart';
// import '../../../../routes/route_path.dart';
// import '../../../../services/firebase.dart';
// import '../../../../services/user.dart';
// import 'recent_chat_state.dart';
//
// class RecentChatController extends GetxController{
//   final state = const AvailableUsers();
//   var index = 0.obs;
//   RxList<UserModel> users = <UserModel>[].obs;
//   final myUserId = UserStore.to.uid;
//   var isLoading = true.obs;
//
//   final RefreshController refreshController1 = RefreshController(initialRefresh: true);
//   final RefreshController refreshController2 = RefreshController(initialRefresh: true);
//
//   onRefreshChatRooms(){
//     loadUsers().then((_) =>
//         refreshController1.refreshCompleted(resetFooterState: true)
//     );
//   }
//
//   onRefreshLoadUser(){
//     asyncLoadData().then((_) =>
//         refreshController2.refreshCompleted(resetFooterState: true)
//     );
//   }
//
//   // void onLoading(){
//   //   // asyncLoadData().then((_) =>
//   //       refreshController1.loadComplete();
//   //   // );
//   // }
//
//
//   @override
//   Future<void> onReady() async {
//     super.onReady();
//     await asyncLoadData();
//     await loadUsers();
//   }
//
//   asyncLoadData() async {
//     isLoading.value = true;
//     var chatRoomList = await FirebaseFireStore.to.getChatRoom();
//     if(chatRoomList.docs.isNotEmpty){
//       state.otherUser.value = [];
//       state.chatRoomList.value = [];
//       for(var chatRoom in chatRoomList.docs){
//         Map<String, dynamic> chatRoomData = chatRoom.data() as Map<String, dynamic>;
//         state.chatRoomList.add(
//             ChatRoomModel.fromJson(chatRoomData)
//         );
//         if(chatRoomData['users'][0] == myUserId){
//           state.otherUser.add(
//               (await FirebaseFireStore.to.getUser(chatRoomData['users'][1]))!
//           );
//         }else{
//           state.otherUser.add(
//               (await FirebaseFireStore.to.getUser(chatRoomData['users'][0]))!
//           );
//         }
//       }
//       Iterable isReversed = state.chatRoomList.reversed;
//       Iterable otherUserReversed = state.otherUser.reversed;
//       state.chatRoomList.value = isReversed.toList() as List<ChatRoomModel>;
//       state.otherUser.value = otherUserReversed.toList() as List<UserModel>;
//       log('This is the list of chat rooms: ${state.chatRoomList}');
//
//       isLoading.value = false;
//     }
//   }
//
//   loadUsers() async {
//     isLoading.value = true;
//     users.value = [];
//     log('Fetching user data');
//     var usersData = FirebaseFireStore.to.getAllUsers();
//     log('Fetching user data complete');
//     usersData.listen((userSnapshot) {
//       log('UserList: ');
//
//       for(var userElement in userSnapshot.docs){
//         log('UserList: ${userElement.data()}');
//         users.add(
//             UserModel.fromJson(userElement.data() as Map<String, dynamic>)
//         );
//       }
//     });
//     isLoading.value = false;
//   }
//
//   createChatRoom(ChatRoomModel chatRoomModel, UserModel otherUser) async {
//     await FirebaseFireStore.to.createChatRoom(chatRoomModel);
//     Get.toNamed(
//         RoutePaths.chatScreen,
//         parameters: {
//           "chatRoomId": chatRoomModel.chatRoomId,
//           "toUserProfile": otherUser.photoId,
//           "toUserName": otherUser.username,
//           "toUserUid": otherUser.uid
//         }
//     );
//   }
//
//   generateChatRoomId(String myUserUid, String otherUserId) {
//     if (myUserUid.substring(0, 1).codeUnitAt(0) > otherUserId.substring(0, 1).codeUnitAt(0)) {
//       return "$otherUserId\_$myUserUid";
//     } else {
//       return "$myUserUid\_$otherUserId";
//     }
//   }
// }