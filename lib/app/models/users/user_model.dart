import 'package:flameloop/app/models/enum/phone_auth_user_state.dart';
import 'package:flameloop/app/models/interest_model/interest_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel{

  const factory UserModel({
    required String uid,
    required String username,
    required String email,
    required String photoId,
    required String phoneNumber,
    required String aboutUser,
    required List<InterestModel> skills,
    required AuthUserState userState
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);
}
