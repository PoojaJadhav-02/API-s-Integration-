// To parse this JSON data, do
//
//     final getSubCatIdModel = getSubCatIdModelFromJson(jsonString);

import 'dart:convert';

GetProductIdModel getSubCatIdModelFromJson(String str) => GetProductIdModel.fromJson(json.decode(str));

String getSubCatIdModelToJson(GetProductIdModel data) => json.encode(data.toJson());

class GetProductIdModel {
  String id;
  String title;
  String description;
  int price;
  Owner owner;
  Category category;
  Category subCategory;
  Category subSubCategory;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  GetProductIdModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.owner,
    required this.category,
    required this.subCategory,
    required this.subSubCategory,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory GetProductIdModel.fromJson(Map<String, dynamic> json) => GetProductIdModel(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    owner: Owner.fromJson(json["owner"]),
    category: Category.fromJson(json["category"]),
    subCategory: Category.fromJson(json["subCategory"]),
    subSubCategory: Category.fromJson(json["subSubCategory"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "price": price,
    "owner": owner.toJson(),
    "category": category.toJson(),
    "subCategory": subCategory.toJson(),
    "subSubCategory": subSubCategory.toJson(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class Category {
  String id;
  String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}

class Owner {
  String id;
  String username;
  String email;

  Owner({
    required this.id,
    required this.username,
    required this.email,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    id: json["_id"],
    username: json["username"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "username": username,
    "email": email,
  };
}
