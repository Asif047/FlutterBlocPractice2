import 'dart:convert';

ModelLoginRequest modelLoginRequestFromJson(String str) => ModelLoginRequest.fromJson(json.decode(str));

String modelLoginRequestToJson(ModelLoginRequest data) => json.encode(data.toJson());

class ModelLoginRequest {
  String username;
  String password;

  ModelLoginRequest({
    required this.username,
    required this.password,
  });

  factory ModelLoginRequest.fromJson(Map<String, dynamic> json) => ModelLoginRequest(
    username: json["username"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
  };
}
