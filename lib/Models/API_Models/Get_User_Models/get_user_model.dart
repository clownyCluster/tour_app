import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_user_model.freezed.dart';
part 'get_user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required bool success,
    required String message,
    required UserData data,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
abstract class UserData with _$UserData {
  const factory UserData({
    required String role,
    required String photo,
    required String id,
    required String name,
    required String email,
    required int phone,
    @JsonKey(name: 'passwordChangedAt') required DateTime passwordChangedAt,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
