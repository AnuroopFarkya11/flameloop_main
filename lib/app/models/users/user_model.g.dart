// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      uid: json['uid'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      photoId: json['photoId'] as String,
      phoneNumber: json['phoneNumber'] as String,
      aboutUser: json['aboutUser'] as String,
      skills: (json['skills'] as List<dynamic>)
          .map((e) => InterestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      userState: $enumDecode(_$AuthUserStateEnumMap, json['userState']),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'username': instance.username,
      'email': instance.email,
      'photoId': instance.photoId,
      'phoneNumber': instance.phoneNumber,
      'aboutUser': instance.aboutUser,
      'skills': instance.skills,
      'userState': _$AuthUserStateEnumMap[instance.userState]!,
    };

const _$AuthUserStateEnumMap = {
  AuthUserState.existingUser: 'existingUser',
  AuthUserState.newUser: 'newUser',
};
