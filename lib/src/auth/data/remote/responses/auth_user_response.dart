// To parse this JSON data, do
//
//     final authUserResponse = authUserResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'auth_user_response.g.dart';

AuthUserResponse authUserResponseFromJson(String str) => AuthUserResponse.fromJson(json.decode(str));

String authUserResponseToJson(AuthUserResponse data) => json.encode(data.toJson());

@JsonSerializable()
class AuthUserResponse {
    @JsonKey(name: "token")
    String? token;

    AuthUserResponse({
        this.token,
    });

    factory AuthUserResponse.fromJson(Map<String, dynamic> json) => _$AuthUserResponseFromJson(json);

    Map<String, dynamic> toJson() => _$AuthUserResponseToJson(this);
}
