// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthLoginRequest _$AuthLoginRequestFromJson(Map<String, dynamic> json) =>
    AuthLoginRequest(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$AuthLoginRequestToJson(AuthLoginRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
