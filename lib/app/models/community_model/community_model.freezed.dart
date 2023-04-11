// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommunityModel _$CommunityModelFromJson(Map<String, dynamic> json) {
  return _CommunityModel.fromJson(json);
}

/// @nodoc
mixin _$CommunityModel {
  List<ParticipantModel> get participantsList =>
      throw _privateConstructorUsedError;
  String get lastMessage => throw _privateConstructorUsedError;
  String get lastMessageBy => throw _privateConstructorUsedError;
  DateTime get lastMessageTm => throw _privateConstructorUsedError;
  String get communityId => throw _privateConstructorUsedError;
  String get communityIcon => throw _privateConstructorUsedError;
  String get communityName => throw _privateConstructorUsedError;
  String get communityDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommunityModelCopyWith<CommunityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityModelCopyWith<$Res> {
  factory $CommunityModelCopyWith(
          CommunityModel value, $Res Function(CommunityModel) then) =
      _$CommunityModelCopyWithImpl<$Res, CommunityModel>;
  @useResult
  $Res call(
      {List<ParticipantModel> participantsList,
      String lastMessage,
      String lastMessageBy,
      DateTime lastMessageTm,
      String communityId,
      String communityIcon,
      String communityName,
      String communityDescription});
}

/// @nodoc
class _$CommunityModelCopyWithImpl<$Res, $Val extends CommunityModel>
    implements $CommunityModelCopyWith<$Res> {
  _$CommunityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantsList = null,
    Object? lastMessage = null,
    Object? lastMessageBy = null,
    Object? lastMessageTm = null,
    Object? communityId = null,
    Object? communityIcon = null,
    Object? communityName = null,
    Object? communityDescription = null,
  }) {
    return _then(_value.copyWith(
      participantsList: null == participantsList
          ? _value.participantsList
          : participantsList // ignore: cast_nullable_to_non_nullable
              as List<ParticipantModel>,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessageBy: null == lastMessageBy
          ? _value.lastMessageBy
          : lastMessageBy // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessageTm: null == lastMessageTm
          ? _value.lastMessageTm
          : lastMessageTm // ignore: cast_nullable_to_non_nullable
              as DateTime,
      communityId: null == communityId
          ? _value.communityId
          : communityId // ignore: cast_nullable_to_non_nullable
              as String,
      communityIcon: null == communityIcon
          ? _value.communityIcon
          : communityIcon // ignore: cast_nullable_to_non_nullable
              as String,
      communityName: null == communityName
          ? _value.communityName
          : communityName // ignore: cast_nullable_to_non_nullable
              as String,
      communityDescription: null == communityDescription
          ? _value.communityDescription
          : communityDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommunityModelCopyWith<$Res>
    implements $CommunityModelCopyWith<$Res> {
  factory _$$_CommunityModelCopyWith(
          _$_CommunityModel value, $Res Function(_$_CommunityModel) then) =
      __$$_CommunityModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ParticipantModel> participantsList,
      String lastMessage,
      String lastMessageBy,
      DateTime lastMessageTm,
      String communityId,
      String communityIcon,
      String communityName,
      String communityDescription});
}

/// @nodoc
class __$$_CommunityModelCopyWithImpl<$Res>
    extends _$CommunityModelCopyWithImpl<$Res, _$_CommunityModel>
    implements _$$_CommunityModelCopyWith<$Res> {
  __$$_CommunityModelCopyWithImpl(
      _$_CommunityModel _value, $Res Function(_$_CommunityModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantsList = null,
    Object? lastMessage = null,
    Object? lastMessageBy = null,
    Object? lastMessageTm = null,
    Object? communityId = null,
    Object? communityIcon = null,
    Object? communityName = null,
    Object? communityDescription = null,
  }) {
    return _then(_$_CommunityModel(
      participantsList: null == participantsList
          ? _value._participantsList
          : participantsList // ignore: cast_nullable_to_non_nullable
              as List<ParticipantModel>,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessageBy: null == lastMessageBy
          ? _value.lastMessageBy
          : lastMessageBy // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessageTm: null == lastMessageTm
          ? _value.lastMessageTm
          : lastMessageTm // ignore: cast_nullable_to_non_nullable
              as DateTime,
      communityId: null == communityId
          ? _value.communityId
          : communityId // ignore: cast_nullable_to_non_nullable
              as String,
      communityIcon: null == communityIcon
          ? _value.communityIcon
          : communityIcon // ignore: cast_nullable_to_non_nullable
              as String,
      communityName: null == communityName
          ? _value.communityName
          : communityName // ignore: cast_nullable_to_non_nullable
              as String,
      communityDescription: null == communityDescription
          ? _value.communityDescription
          : communityDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommunityModel implements _CommunityModel {
  const _$_CommunityModel(
      {required final List<ParticipantModel> participantsList,
      required this.lastMessage,
      required this.lastMessageBy,
      required this.lastMessageTm,
      required this.communityId,
      required this.communityIcon,
      required this.communityName,
      required this.communityDescription})
      : _participantsList = participantsList;

  factory _$_CommunityModel.fromJson(Map<String, dynamic> json) =>
      _$$_CommunityModelFromJson(json);

  final List<ParticipantModel> _participantsList;
  @override
  List<ParticipantModel> get participantsList {
    if (_participantsList is EqualUnmodifiableListView)
      return _participantsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participantsList);
  }

  @override
  final String lastMessage;
  @override
  final String lastMessageBy;
  @override
  final DateTime lastMessageTm;
  @override
  final String communityId;
  @override
  final String communityIcon;
  @override
  final String communityName;
  @override
  final String communityDescription;

  @override
  String toString() {
    return 'CommunityModel(participantsList: $participantsList, lastMessage: $lastMessage, lastMessageBy: $lastMessageBy, lastMessageTm: $lastMessageTm, communityId: $communityId, communityIcon: $communityIcon, communityName: $communityName, communityDescription: $communityDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommunityModel &&
            const DeepCollectionEquality()
                .equals(other._participantsList, _participantsList) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.lastMessageBy, lastMessageBy) ||
                other.lastMessageBy == lastMessageBy) &&
            (identical(other.lastMessageTm, lastMessageTm) ||
                other.lastMessageTm == lastMessageTm) &&
            (identical(other.communityId, communityId) ||
                other.communityId == communityId) &&
            (identical(other.communityIcon, communityIcon) ||
                other.communityIcon == communityIcon) &&
            (identical(other.communityName, communityName) ||
                other.communityName == communityName) &&
            (identical(other.communityDescription, communityDescription) ||
                other.communityDescription == communityDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_participantsList),
      lastMessage,
      lastMessageBy,
      lastMessageTm,
      communityId,
      communityIcon,
      communityName,
      communityDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommunityModelCopyWith<_$_CommunityModel> get copyWith =>
      __$$_CommunityModelCopyWithImpl<_$_CommunityModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommunityModelToJson(
      this,
    );
  }
}

abstract class _CommunityModel implements CommunityModel {
  const factory _CommunityModel(
      {required final List<ParticipantModel> participantsList,
      required final String lastMessage,
      required final String lastMessageBy,
      required final DateTime lastMessageTm,
      required final String communityId,
      required final String communityIcon,
      required final String communityName,
      required final String communityDescription}) = _$_CommunityModel;

  factory _CommunityModel.fromJson(Map<String, dynamic> json) =
      _$_CommunityModel.fromJson;

  @override
  List<ParticipantModel> get participantsList;
  @override
  String get lastMessage;
  @override
  String get lastMessageBy;
  @override
  DateTime get lastMessageTm;
  @override
  String get communityId;
  @override
  String get communityIcon;
  @override
  String get communityName;
  @override
  String get communityDescription;
  @override
  @JsonKey(ignore: true)
  _$$_CommunityModelCopyWith<_$_CommunityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ParticipantModel _$ParticipantModelFromJson(Map<String, dynamic> json) {
  return _ParticipantModel.fromJson(json);
}

/// @nodoc
mixin _$ParticipantModel {
  String get uid => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get userProfile => throw _privateConstructorUsedError;
  String get userRole => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParticipantModelCopyWith<ParticipantModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParticipantModelCopyWith<$Res> {
  factory $ParticipantModelCopyWith(
          ParticipantModel value, $Res Function(ParticipantModel) then) =
      _$ParticipantModelCopyWithImpl<$Res, ParticipantModel>;
  @useResult
  $Res call({String uid, String username, String userProfile, String userRole});
}

/// @nodoc
class _$ParticipantModelCopyWithImpl<$Res, $Val extends ParticipantModel>
    implements $ParticipantModelCopyWith<$Res> {
  _$ParticipantModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? username = null,
    Object? userProfile = null,
    Object? userRole = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      userProfile: null == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as String,
      userRole: null == userRole
          ? _value.userRole
          : userRole // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ParticipantModelCopyWith<$Res>
    implements $ParticipantModelCopyWith<$Res> {
  factory _$$_ParticipantModelCopyWith(
          _$_ParticipantModel value, $Res Function(_$_ParticipantModel) then) =
      __$$_ParticipantModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, String username, String userProfile, String userRole});
}

/// @nodoc
class __$$_ParticipantModelCopyWithImpl<$Res>
    extends _$ParticipantModelCopyWithImpl<$Res, _$_ParticipantModel>
    implements _$$_ParticipantModelCopyWith<$Res> {
  __$$_ParticipantModelCopyWithImpl(
      _$_ParticipantModel _value, $Res Function(_$_ParticipantModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? username = null,
    Object? userProfile = null,
    Object? userRole = null,
  }) {
    return _then(_$_ParticipantModel(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      userProfile: null == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as String,
      userRole: null == userRole
          ? _value.userRole
          : userRole // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ParticipantModel implements _ParticipantModel {
  const _$_ParticipantModel(
      {required this.uid,
      required this.username,
      required this.userProfile,
      required this.userRole});

  factory _$_ParticipantModel.fromJson(Map<String, dynamic> json) =>
      _$$_ParticipantModelFromJson(json);

  @override
  final String uid;
  @override
  final String username;
  @override
  final String userProfile;
  @override
  final String userRole;

  @override
  String toString() {
    return 'ParticipantModel(uid: $uid, username: $username, userProfile: $userProfile, userRole: $userRole)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ParticipantModel &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.userProfile, userProfile) ||
                other.userProfile == userProfile) &&
            (identical(other.userRole, userRole) ||
                other.userRole == userRole));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, username, userProfile, userRole);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ParticipantModelCopyWith<_$_ParticipantModel> get copyWith =>
      __$$_ParticipantModelCopyWithImpl<_$_ParticipantModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ParticipantModelToJson(
      this,
    );
  }
}

abstract class _ParticipantModel implements ParticipantModel {
  const factory _ParticipantModel(
      {required final String uid,
      required final String username,
      required final String userProfile,
      required final String userRole}) = _$_ParticipantModel;

  factory _ParticipantModel.fromJson(Map<String, dynamic> json) =
      _$_ParticipantModel.fromJson;

  @override
  String get uid;
  @override
  String get username;
  @override
  String get userProfile;
  @override
  String get userRole;
  @override
  @JsonKey(ignore: true)
  _$$_ParticipantModelCopyWith<_$_ParticipantModel> get copyWith =>
      throw _privateConstructorUsedError;
}
