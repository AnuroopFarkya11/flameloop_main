// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatRoomModel _$ChatRoomModelFromJson(Map<String, dynamic> json) {
  return _ChatRoomModel.fromJson(json);
}

/// @nodoc
mixin _$ChatRoomModel {
  List<String> get users => throw _privateConstructorUsedError;
  List<String> get usersProfile => throw _privateConstructorUsedError;
  List<String> get usersName => throw _privateConstructorUsedError;
  String get lastMessage => throw _privateConstructorUsedError;
  String get lastMessageBy => throw _privateConstructorUsedError;
  DateTime get lastMessageTm => throw _privateConstructorUsedError;
  String get chatRoomId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatRoomModelCopyWith<ChatRoomModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomModelCopyWith<$Res> {
  factory $ChatRoomModelCopyWith(
          ChatRoomModel value, $Res Function(ChatRoomModel) then) =
      _$ChatRoomModelCopyWithImpl<$Res, ChatRoomModel>;
  @useResult
  $Res call(
      {List<String> users,
      List<String> usersProfile,
      List<String> usersName,
      String lastMessage,
      String lastMessageBy,
      DateTime lastMessageTm,
      String chatRoomId});
}

/// @nodoc
class _$ChatRoomModelCopyWithImpl<$Res, $Val extends ChatRoomModel>
    implements $ChatRoomModelCopyWith<$Res> {
  _$ChatRoomModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? usersProfile = null,
    Object? usersName = null,
    Object? lastMessage = null,
    Object? lastMessageBy = null,
    Object? lastMessageTm = null,
    Object? chatRoomId = null,
  }) {
    return _then(_value.copyWith(
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<String>,
      usersProfile: null == usersProfile
          ? _value.usersProfile
          : usersProfile // ignore: cast_nullable_to_non_nullable
              as List<String>,
      usersName: null == usersName
          ? _value.usersName
          : usersName // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      chatRoomId: null == chatRoomId
          ? _value.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatRoomModelCopyWith<$Res>
    implements $ChatRoomModelCopyWith<$Res> {
  factory _$$_ChatRoomModelCopyWith(
          _$_ChatRoomModel value, $Res Function(_$_ChatRoomModel) then) =
      __$$_ChatRoomModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> users,
      List<String> usersProfile,
      List<String> usersName,
      String lastMessage,
      String lastMessageBy,
      DateTime lastMessageTm,
      String chatRoomId});
}

/// @nodoc
class __$$_ChatRoomModelCopyWithImpl<$Res>
    extends _$ChatRoomModelCopyWithImpl<$Res, _$_ChatRoomModel>
    implements _$$_ChatRoomModelCopyWith<$Res> {
  __$$_ChatRoomModelCopyWithImpl(
      _$_ChatRoomModel _value, $Res Function(_$_ChatRoomModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? usersProfile = null,
    Object? usersName = null,
    Object? lastMessage = null,
    Object? lastMessageBy = null,
    Object? lastMessageTm = null,
    Object? chatRoomId = null,
  }) {
    return _then(_$_ChatRoomModel(
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<String>,
      usersProfile: null == usersProfile
          ? _value._usersProfile
          : usersProfile // ignore: cast_nullable_to_non_nullable
              as List<String>,
      usersName: null == usersName
          ? _value._usersName
          : usersName // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      chatRoomId: null == chatRoomId
          ? _value.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatRoomModel implements _ChatRoomModel {
  const _$_ChatRoomModel(
      {required final List<String> users,
      required final List<String> usersProfile,
      required final List<String> usersName,
      required this.lastMessage,
      required this.lastMessageBy,
      required this.lastMessageTm,
      required this.chatRoomId})
      : _users = users,
        _usersProfile = usersProfile,
        _usersName = usersName;

  factory _$_ChatRoomModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChatRoomModelFromJson(json);

  final List<String> _users;
  @override
  List<String> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  final List<String> _usersProfile;
  @override
  List<String> get usersProfile {
    if (_usersProfile is EqualUnmodifiableListView) return _usersProfile;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usersProfile);
  }

  final List<String> _usersName;
  @override
  List<String> get usersName {
    if (_usersName is EqualUnmodifiableListView) return _usersName;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usersName);
  }

  @override
  final String lastMessage;
  @override
  final String lastMessageBy;
  @override
  final DateTime lastMessageTm;
  @override
  final String chatRoomId;

  @override
  String toString() {
    return 'ChatRoomModel(users: $users, usersProfile: $usersProfile, usersName: $usersName, lastMessage: $lastMessage, lastMessageBy: $lastMessageBy, lastMessageTm: $lastMessageTm, chatRoomId: $chatRoomId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatRoomModel &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality()
                .equals(other._usersProfile, _usersProfile) &&
            const DeepCollectionEquality()
                .equals(other._usersName, _usersName) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.lastMessageBy, lastMessageBy) ||
                other.lastMessageBy == lastMessageBy) &&
            (identical(other.lastMessageTm, lastMessageTm) ||
                other.lastMessageTm == lastMessageTm) &&
            (identical(other.chatRoomId, chatRoomId) ||
                other.chatRoomId == chatRoomId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(_usersProfile),
      const DeepCollectionEquality().hash(_usersName),
      lastMessage,
      lastMessageBy,
      lastMessageTm,
      chatRoomId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatRoomModelCopyWith<_$_ChatRoomModel> get copyWith =>
      __$$_ChatRoomModelCopyWithImpl<_$_ChatRoomModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatRoomModelToJson(
      this,
    );
  }
}

abstract class _ChatRoomModel implements ChatRoomModel {
  const factory _ChatRoomModel(
      {required final List<String> users,
      required final List<String> usersProfile,
      required final List<String> usersName,
      required final String lastMessage,
      required final String lastMessageBy,
      required final DateTime lastMessageTm,
      required final String chatRoomId}) = _$_ChatRoomModel;

  factory _ChatRoomModel.fromJson(Map<String, dynamic> json) =
      _$_ChatRoomModel.fromJson;

  @override
  List<String> get users;
  @override
  List<String> get usersProfile;
  @override
  List<String> get usersName;
  @override
  String get lastMessage;
  @override
  String get lastMessageBy;
  @override
  DateTime get lastMessageTm;
  @override
  String get chatRoomId;
  @override
  @JsonKey(ignore: true)
  _$$_ChatRoomModelCopyWith<_$_ChatRoomModel> get copyWith =>
      throw _privateConstructorUsedError;
}
