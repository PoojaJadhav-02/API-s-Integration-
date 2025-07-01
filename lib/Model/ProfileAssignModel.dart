import 'dart:convert';

ProfileAssignModel profileAssignModelFromJson(String str) => ProfileAssignModel.fromJson(json.decode(str));

String profileAssignModelToJson(ProfileAssignModel data) => json.encode(data.toJson());

class ProfileAssignModel {
  String id;
  String username;
  String name;
  String email;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  ProfileAssignModel({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ProfileAssignModel.fromJson(Map<String, dynamic> json) => ProfileAssignModel(
    id: json["_id"],
    username: json["username"],
    name: json["name"],
    email: json["email"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "username": username,
    "name": name,
    "email": email,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
