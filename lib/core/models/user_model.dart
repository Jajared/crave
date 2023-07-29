import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.profilePicture});

  String id;
  String name;
  String email;
  String profilePicture;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        profilePicture: json["profilePicture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "profilePicture": profilePicture,
      };
}
