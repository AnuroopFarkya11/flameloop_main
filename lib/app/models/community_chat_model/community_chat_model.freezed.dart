// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommunityChatModel _$CommunityChatModelFromJson(Map<String, dynamic> json) {
  return _CommunityChatModel.fromJson(json);
}

/// @nodoc
mixin _$CommunityChatModel {
  String get message => throw _privateConstructorUsedError;
  ParticipantModel get sendBy => throw _privateConstructorUsedError;
  DateTime get messageTm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommunityChatModelCopyWith<CommunityChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityChatModelCopyWith<$Res> {
  factory $CommunityChatModelCopyWith(
          CommunityChatModel value, $Res Function(CommunityChatModel) then) =
      _$CommunityChatModelCopyWithImpl<$Res, CommunityChatModel>;
  @useResult
  $Res call({String message, ParticipantModel sendBy, DateTime messageTm});

  $ParticipantModelCopyWith<$Res> get sendBy;
}

/// @nodoc
class _$CommunityChatModelCopyWithImpl<$Res, $Val extends CommunityChatModel>
    implements $CommunityChatModelCopyWith<$Res> {
  _$CommunityChatModelCopyWithImpl(this._value, this._then);

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
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      sendBy: null == sendBy
          ? _value.sendBy
          : sendBy // ignore: cast_nullable_to_non_nullable
              as ParticipantModel,
      messageTm: null == messageTm
          ? _value.messageTm
          : messageTm // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ParticipantModelCopyWith<$Res> get sendBy {
    return $ParticipantModelCopyWith<$Res>(_value.sendBy, (value) {
      return _then(_value.copyWith(sendBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CommunityChatModelCopyWith<$Res>
    implements $CommunityChatModelCopyWith<$Res> {
  factory _$$_CommunityChatModelCopyWith(_$_CommunityChatModel value,
          $Res Function(_$_CommunityChatModel) then) =
      __$$_CommunityChatModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, ParticipantModel sendBy, DateTime messageTm});

  @override
  $ParticipantModelCopyWith<$Res> get sendBy;
}

/// @nodoc
class __$$_CommunityChatModelCopyWithImpl<$Res>
    extends _$CommunityChatModelCopyWithImpl<$Res, _$_CommunityChatModel>
    implements _$$_CommunityChatModelCopyWith<$Res> {
  __$$_CommunityChatModelCopyWithImpl(
      _$_CommunityChatModel _value, $Res Function(_$_CommunityChatModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? sendBy = null,
    Object? messageTm = null,
  }) {
    return _then(_$_CommunityChatModel(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      sendBy: null == sendBy
          ? _value.sendBy
          : sendBy // ignore: cast_nullable_to_non_nullable
              as ParticipantModel,
      messageTm: null == messageTm
          ? _value.messageTm
          : messageTm // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommunityChatModel implements _CommunityChatModel {
  const _$_CommunityChatModel(
      {required this.message, required this.sendBy, required this.messageTm});

  factory _$_CommunityChatModel.fromJson(Map<String, dynamic> json) =>
      _$$_CommunityChatModelFromJson(json);

  @override
  final String message;
  @override
  final ParticipantModel sendBy;
  @override
  final DateTime messageTm;

  @override
  String toString() {
    return 'CommunityChatModel(message: $message, sendBy: $sendBy, messageTm: $messageTm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommunityChatModel &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.sendBy, sendBy) || other.sendBy == sendBy) &&
            (identical(other.messageTm, messageTm) ||
                other.messageTm == messageTm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, sendBy, messageTm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommunityChatModelCopyWith<_$_CommunityChatModel> get copyWith =>
      __$$_CommunityChatModelCopyWithImpl<_$_CommunityChatModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommunityChatModelToJson(
      this,
    );
  }
}

abstract class _CommunityChatModel implements CommunityChatModel {
  const factory _CommunityChatModel(
      {required final String message,
      required final ParticipantModel sendBy,
      required final DateTime messageTm}) = _$_CommunityChatModel;

  factory _CommunityChatModel.fromJson(Map<String, dynamic> json) =
      _$_CommunityChatModel.fromJson;

  @override
  String get message;
  @override
  ParticipantModel get sendBy;
  @override
  DateTime get messageTm;
  @override
  @JsonKey(ignore: true)
  _$$_CommunityChatModelCopyWith<_$_CommunityChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}
