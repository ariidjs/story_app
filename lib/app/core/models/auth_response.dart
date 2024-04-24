// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  bool? error;
  String? message;
  LoginResult? loginResult;

  AuthResponse({this.error, this.message, this.loginResult});

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}

@JsonSerializable()
class LoginResult {
  String? userId;
  String? name;
  String? token;

  LoginResult({this.userId, this.name, this.token});

  factory LoginResult.fromJson(Map<String, dynamic> json) =>
      _$LoginResultFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResultToJson(this);
}
