import 'package:flameloop/app/models/community_model/community_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_chat_model.freezed.dart';
part 'community_chat_model.g.dart';

@freezed
class CommunityChatModel with _$CommunityChatModel{

  const factory CommunityChatModel({
    required String message,
    required ParticipantModel sendBy,
    required DateTime messageTm,
  }) = _CommunityChatModel;

  factory CommunityChatModel.fromJson(Map<String, Object?> json) => _$CommunityChatModelFromJson(json);
}