// To parse this JSON data, do
//
//     final personResponse = personResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'person_response.g.dart';

PersonResponse personResponseFromJson(String str) => PersonResponse.fromJson(json.decode(str));

String personResponseToJson(PersonResponse data) => json.encode(data.toJson());

@JsonSerializable()
class PersonResponse {
    @JsonKey(name: "data")
    Data? data;

    PersonResponse({
        this.data,
    });

    factory PersonResponse.fromJson(Map<String, dynamic> json) => _$PersonResponseFromJson(json);

    Map<String, dynamic> toJson() => _$PersonResponseToJson(this);
}

@JsonSerializable()
class Data {
    @JsonKey(name: "id")
    int? id;
    @JsonKey(name: "email")
    String? email;
    @JsonKey(name: "first_name")
    String? firstName;
    @JsonKey(name: "last_name")
    String? lastName;
    @JsonKey(name: "avatar")
    String? avatar;

    Data({
        this.id,
        this.email,
        this.firstName,
        this.lastName,
        this.avatar,
    });

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);
}
