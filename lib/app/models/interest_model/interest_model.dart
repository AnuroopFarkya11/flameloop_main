import 'package:freezed_annotation/freezed_annotation.dart';

part 'interest_model.freezed.dart';
part 'interest_model.g.dart';

@freezed
class InterestModel with _$InterestModel{

  const factory InterestModel({
    required String name,
    required String icon
  }) = _InterestModel;

  factory InterestModel.fromJson(Map<String, Object?> json) => _$InterestModelFromJson(json);
}
