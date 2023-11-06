import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel with _$LoginModel {
  LoginModel._();

  factory LoginModel({
    @JsonKey(name: 'access_token')
    String? accessToken,
    @JsonKey(name: 'token_type')
    String? tokenType,
    @JsonKey(name: 'expires_in')
    int? expiresIn,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}
