
import 'dart:convert';

AllProductModel allProductModelFromJson(String str) => AllProductModel.fromJson(json.decode(str));

String allProductModelToJson(AllProductModel data) => json.encode(data.toJson());

class AllProductModel {
  bool success;
  String message;
  List<Datum> data;

  AllProductModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory AllProductModel.fromJson(Map<String, dynamic> json) => AllProductModel(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  String title;
  String description;
  int price;
  Owner owner;
  Category category;
  Category? subCategory;
  Category? subSubCategory;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    owner: Owner.fromJson(json["owner"]),
    category: Category.fromJson(json["category"]),
    subCategory: json["subCategory"] == null ? null : Category.fromJson(json["subCategory"]),
    subSubCategory: json["subSubCategory"] == null ? null : Category.fromJson(json["subSubCategory"]),
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
    "subCategory": subCategory?.toJson(),
    "subSubCategory": subSubCategory?.toJson(),
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
