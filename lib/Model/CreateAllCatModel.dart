

import 'dart:convert';

CreateAllCatModel createAllCatModelFromJson(String str) => CreateAllCatModel.fromJson(json.decode(str));

String createAllCatModelToJson(CreateAllCatModel data) => json.encode(data.toJson());

class CreateAllCatModel {
  bool success;
  Data product;
  String message;
  Data data;

  CreateAllCatModel({
    required this.success,
    required this.product,
    required this.message,
    required this.data,
  });

  factory CreateAllCatModel.fromJson(Map<String, dynamic> json) => CreateAllCatModel(
    success: json["success"],
    product: Data.fromJson(json["product"]),
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "product": product.toJson(),
    "message": message,
    "data": data.toJson(),
  };
}

// class Data {
//   String title;
//   String description;
//   int price;
//   String owner;
//   String category;
//   String subCategory;
//   String subSubCategory;
//   String id;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int v;
//
//   Data({
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.owner,
//     required this.category,
//     required this.subCategory,
//     required this.subSubCategory,
//     required this.id,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.v,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     title: json["title"],
//     description: json["description"],
//     price: json["price"],
//     owner: json["owner"],
//     category: json["category"],
//     subCategory: json["subCategory"],
//     subSubCategory: json["subSubCategory"],
//     id: json["_id"],
//     createdAt: DateTime.parse(json["createdAt"]),
//     updatedAt: DateTime.parse(json["updatedAt"]),
//     v: json["__v"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "title": title,
//     "description": description,
//     "price": price,
//     "owner": owner,
//     "category": category,
//     "subCategory": subCategory,
//     "subSubCategory": subSubCategory,
//     "_id": id,
//     "createdAt": createdAt.toIso8601String(),
//     "updatedAt": updatedAt.toIso8601String(),
//     "__v": v,
//   };
// }


class Data {
  String title;
  String description;
  int price;
  String owner;
  String category;
  String subCategory;
  String? subSubCategory; // ✅ Make this nullable
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Data({
    required this.title,
    required this.description,
    required this.price,
    required this.owner,
    required this.category,
    required this.subCategory,
    required this.subSubCategory, // ✅ Still required, just nullable
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    title: json["title"],
    description: json["description"],
    price: json["price"],
    owner: json["owner"],
    category: json["category"],
    subCategory: json["subCategory"],
    subSubCategory: json["subSubCategory"], // ✅ no .toString() — allows null
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "price": price,
    "owner": owner,
    "category": category,
    "subCategory": subCategory,
    "subSubCategory": subSubCategory, // ✅ will be null if not set
    "_id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
