// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommunityChatModel _$$_CommunityChatModelFromJson(
        Map<String, dynamic> json) =>
    _$_CommunityChatModel(
      message: json['message'] as String,
      sendBy: ParticipantModel.fromJson(json['sendBy'] as Map<String, dynamic>),
      messageTm: DateTime.parse(json['messageTm'] as String),
    );

Map<String, dynamic> _$$_CommunityChatModelToJson(
        _$_CommunityChatModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'sendBy': instance.sendBy.toJson(),
      'messageTm': instance.messageTm.toIso8601String(),
    };
