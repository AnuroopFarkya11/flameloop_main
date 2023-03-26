import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../models/chat_room_model/chat_room_model.dart';
import '../../../models/users/user_model.dart';
import '../../../services/firebase.dart';
import '../../../services/user.dart';
import 'recent_chat_state.dart';

class RecentChatController extends GetxController{
  final state = RecentChatState();
  var index = 0.obs;
  final myUserId = UserStore.to.uid;
  var isLoading = true.obs;

  final RefreshController refreshController =RefreshController(initialRefresh: true);

  onRefresh(){
    asyncLoadData().then((_) =>
        refreshController.refreshCompleted(resetFooterState: true)
    );
  }

  void onLoading(){
    // asyncLoadData().then((_) =>
        refreshController.loadComplete();
    // );
  }


  @override
  Future<void> onReady() async {
    super.onReady();
    await asyncLoadData();
  }
  
  asyncLoadData() async {
    isLoading.value = true;
    var chatRoomList = await FirebaseFireStore.to.getChatRoom();
    if(chatRoomList.docs.isNotEmpty){
      state.otherUser.value = [];
      state.chatRoomList.value = [];
      for(var chatRoom in chatRoomList.docs){
        Map<String, dynamic> chatRoomData = chatRoom.data() as Map<String, dynamic>;
        state.chatRoomList.add(
          ChatRoomModel.fromJson(chatRoomData)
        );
        if(chatRoomData['users'][0] == myUserId){
          state.otherUser.add(
            (await FirebaseFireStore.to.getUser(chatRoomData['users'][1]))!
          );
        }else{
          state.otherUser.add(
              (await FirebaseFireStore.to.getUser(chatRoomData['users'][0]))!
          );
        }
      }
      Iterable isReversed = state.chatRoomList.reversed;
      Iterable otherUserReversed = state.otherUser.reversed;
      state.chatRoomList.value = isReversed.toList() as List<ChatRoomModel>;
      state.otherUser.value = otherUserReversed.toList() as List<UserModel>;
      isLoading.value = false;
    }
  }
}