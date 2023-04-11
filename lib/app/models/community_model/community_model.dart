import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_model.freezed.dart';
part 'community_model.g.dart';

@freezed
class CommunityModel with _$CommunityModel{

  const factory CommunityModel({
    required List<ParticipantModel> participantsList,
    required String lastMessage,
    required String lastMessageBy,
    required DateTime lastMessageTm,
    required String communityId,
    required String communityIcon,
    required String communityName,
    required String communityDescription,
  }) = _CommunityModel;

  factory CommunityModel.fromJson(Map<String, Object?> json) => _$CommunityModelFromJson(json);
}

@freezed
class ParticipantModel with _$ParticipantModel{

  const factory ParticipantModel({
    required String uid,
    required String username,
    required String userProfile,
    required String userRole,
  }) = _ParticipantModel;

  factory ParticipantModel.fromJson(Map<String, Object?> json) => _$ParticipantModelFromJson(json);
}