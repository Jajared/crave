import 'dart:convert';

import 'package:crave/core/models/user_model.dart';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel(
      {required this.image, required this.author, required this.location});

  String image;
  UserModel author;
  Map<String, double> location;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        image: json["image"],
        author: UserModel.fromJson(json["author"]),
        location: {
          "latitude": json["location"]["latitude"],
          "longitude": json["location"]["longitude"]
        },
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "author": author.toJson(),
        "location": {
          "latitude": location["latitude"],
          "longitude": location["longitude"]
        }
      };
}
