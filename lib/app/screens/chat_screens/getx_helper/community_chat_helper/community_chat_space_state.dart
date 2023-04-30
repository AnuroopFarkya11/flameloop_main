import 'package:flameloop/app/models/community_chat_model/community_chat_model.dart';
import 'package:flameloop/app/models/community_model/community_model.dart';
import 'package:get/get.dart';

class CommunityChatSpaceState{
  var _isLoading = true.obs;
  RxList<CommunityChatModel> chatData = <CommunityChatModel>[].obs;
  var communityName = ''.obs;
  var communityId = ''.obs;
  var participants = <ParticipantModel>[].obs;
  var communityProfile = ''.obs;
  var communityDescription = ''.obs;
}