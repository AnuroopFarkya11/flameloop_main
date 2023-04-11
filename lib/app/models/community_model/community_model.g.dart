// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommunityModel _$$_CommunityModelFromJson(Map<String, dynamic> json) =>
    _$_CommunityModel(
      participantsList: (json['participantsList'] as List<dynamic>)
          .map((e) => ParticipantModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastMessage: json['lastMessage'] as String,
      lastMessageBy: json['lastMessageBy'] as String,
      lastMessageTm: DateTime.parse(json['lastMessageTm'] as String),
      communityId: json['communityId'] as String,
      communityIcon: json['communityIcon'] as String,
      communityName: json['communityName'] as String,
      communityDescription: json['communityDescription'] as String,
    );

Map<String, dynamic> _$$_CommunityModelToJson(_$_CommunityModel instance) =>
    <String, dynamic>{
      'participantsList': instance.participantsList.map((e) => e.toJson()).toList(),
      'lastMessage': instance.lastMessage,
      'lastMessageBy': instance.lastMessageBy,
      'lastMessageTm': instance.lastMessageTm.toIso8601String(),
      'communityId': instance.communityId,
      'communityIcon': instance.communityIcon,
      'communityName': instance.communityName,
      'communityDescription': instance.communityDescription,
    };

_$_ParticipantModel _$$_ParticipantModelFromJson(Map<String, dynamic> json) =>
    _$_ParticipantModel(
      uid: json['uid'] as String,
      username: json['username'] as String,
      userProfile: json['userProfile'] as String,
      userRole: json['userRole'] as String,
    );

Map<String, dynamic> _$$_ParticipantModelToJson(_$_ParticipantModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'username': instance.username,
      'userProfile': instance.userProfile,
      'userRole': instance.userRole,
    };
