import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_space_model.freezed.dart';
part 'chat_space_model.g.dart';

@freezed
class ChatSpaceModel with _$ChatSpaceModel{

  const factory ChatSpaceModel({
    required String message,
    required String sendBy,
    required DateTime messageTm,
    required String sendByPhoto,
  }) = _ChatSpaceModel;

  factory ChatSpaceModel.fromJson(Map<String, Object?> json) => _$ChatSpaceModelFromJson(json);
}