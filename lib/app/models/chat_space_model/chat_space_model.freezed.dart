// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_space_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatSpaceModel _$ChatSpaceModelFromJson(Map<String, dynamic> json) {
  return _ChatSpaceModel.fromJson(json);
}

/// @nodoc
mixin _$ChatSpaceModel {
  String get message => throw _privateConstructorUsedError;
  String get sendBy => throw _privateConstructorUsedError;
  DateTime get messageTm => throw _privateConstructorUsedError;
  String get sendByPhoto => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatSpaceModelCopyWith<ChatSpaceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatSpaceModelCopyWith<$Res> {
  factory $ChatSpaceModelCopyWith(
          ChatSpaceModel value, $Res Function(ChatSpaceModel) then) =
      _$ChatSpaceModelCopyWithImpl<$Res, ChatSpaceModel>;
  @useResult
  $Res call(
      {String message, String sendBy, DateTime messageTm, String sendByPhoto});
}

/// @nodoc
class _$ChatSpaceModelCopyWithImpl<$Res, $Val extends ChatSpaceModel>
    implements $ChatSpaceModelCopyWith<$Res> {
  _$ChatSpaceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? sendBy = null,
    Object? messageTm = null,
    Object? sendByPhoto = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      sendBy: null == sendBy
          ? _value.sendBy
          : sendBy // ignore: cast_nullable_to_non_nullable
              as String,
      messageTm: null == messageTm
          ? _value.messageTm
          : messageTm // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sendByPhoto: null == sendByPhoto
          ? _value.sendByPhoto
          : sendByPhoto // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatSpaceModelCopyWith<$Res>
    implements $ChatSpaceModelCopyWith<$Res> {
  factory _$$_ChatSpaceModelCopyWith(
          _$_ChatSpaceModel value, $Res Function(_$_ChatSpaceModel) then) =
      __$$_ChatSpaceModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message, String sendBy, DateTime messageTm, String sendByPhoto});
}

/// @nodoc
class __$$_ChatSpaceModelCopyWithImpl<$Res>
    extends _$ChatSpaceModelCopyWithImpl<$Res, _$_ChatSpaceModel>
    implements _$$_ChatSpaceModelCopyWith<$Res> {
  __$$_ChatSpaceModelCopyWithImpl(
      _$_ChatSpaceModel _value, $Res Function(_$_ChatSpaceModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? sendBy = null,
    Object? messageTm = null,
    Object? sendByPhoto = null,
  }) {
    return _then(_$_ChatSpaceModel(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      sendBy: null == sendBy
          ? _value.sendBy
          : sendBy // ignore: cast_nullable_to_non_nullable
              as String,
      messageTm: null == messageTm
          ? _value.messageTm
          : messageTm // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sendByPhoto: null == sendByPhoto
          ? _value.sendByPhoto
          : sendByPhoto // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatSpaceModel implements _ChatSpaceModel {
  const _$_ChatSpaceModel(
      {required this.message,
      required this.sendBy,
      required this.messageTm,
      required this.sendByPhoto});

  factory _$_ChatSpaceModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChatSpaceModelFromJson(json);

  @override
  final String message;
  @override
  final String sendBy;
  @override
  final DateTime messageTm;
  @override
  final String sendByPhoto;

  @override
  String toString() {
    return 'ChatSpaceModel(message: $message, sendBy: $sendBy, messageTm: $messageTm, sendByPhoto: $sendByPhoto)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatSpaceModel &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.sendBy, sendBy) || other.sendBy == sendBy) &&
            (identical(other.messageTm, messageTm) ||
                other.messageTm == messageTm) &&
            (identical(other.sendByPhoto, sendByPhoto) ||
                other.sendByPhoto == sendByPhoto));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, message, sendBy, messageTm, sendByPhoto);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatSpaceModelCopyWith<_$_ChatSpaceModel> get copyWith =>
      __$$_ChatSpaceModelCopyWithImpl<_$_ChatSpaceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatSpaceModelToJson(
      this,
    );
  }
}

abstract class _ChatSpaceModel implements ChatSpaceModel {
  const factory _ChatSpaceModel(
      {required final String message,
      required final String sendBy,
      required final DateTime messageTm,
      required final String sendByPhoto}) = _$_ChatSpaceModel;

  factory _ChatSpaceModel.fromJson(Map<String, dynamic> json) =
      _$_ChatSpaceModel.fromJson;

  @override
  String get message;
  @override
  String get sendBy;
  @override
  DateTime get messageTm;
  @override
  String get sendByPhoto;
  @override
  @JsonKey(ignore: true)
  _$$_ChatSpaceModelCopyWith<_$_ChatSpaceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
