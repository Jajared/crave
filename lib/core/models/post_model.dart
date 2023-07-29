import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel(
      {required this.image, required this.author, required this.location});

  String image;
  String author;
  Map<String, double> location;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        image: json["image"],
        author: json["author"],
        location: {
          "latitude": json["location"]["latitude"],
          "longitude": json["location"]["longitude"]
        },
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "author": author,
        "location": {
          "latitude": location["latitude"],
          "longitude": location["longitude"]
        }
      };
}
