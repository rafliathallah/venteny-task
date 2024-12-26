import 'package:json_annotation/json_annotation.dart';

part 'auth_login_request.g.dart';

@JsonSerializable()
class AuthLoginRequest {
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'password')
  String? password;

  AuthLoginRequest({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() => _$AuthLoginRequestToJson(this);
}
