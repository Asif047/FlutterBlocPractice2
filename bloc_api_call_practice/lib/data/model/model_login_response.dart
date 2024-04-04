import 'dart:convert';

ModelLoginResponse modelLoginResponseFromJson(String str) => ModelLoginResponse.fromJson(json.decode(str));

String modelLoginResponseToJson(ModelLoginResponse data) => json.encode(data.toJson());

class ModelLoginResponse {
  int id;
  String username;
  String email;
  String firstName;
  String lastName;
  String gender;
  String image;
  String token;

  ModelLoginResponse({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.token,
  });

  factory ModelLoginResponse.fromJson(Map<String, dynamic> json) => ModelLoginResponse(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    gender: json["gender"],
    image: json["image"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
    "gender": gender,
    "image": image,
    "token": token,
  };
}
