// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_space_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatSpaceModel _$$_ChatSpaceModelFromJson(Map<String, dynamic> json) =>
    _$_ChatSpaceModel(
      message: json['message'] as String,
      sendBy: json['sendBy'] as String,
      messageTm: DateTime.parse(json['messageTm'] as String),
      sendByPhoto: json['sendByPhoto'] as String,
    );

Map<String, dynamic> _$$_ChatSpaceModelToJson(_$_ChatSpaceModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'sendBy': instance.sendBy,
      'messageTm': instance.messageTm.toIso8601String(),
      'sendByPhoto': instance.sendByPhoto,
    };
