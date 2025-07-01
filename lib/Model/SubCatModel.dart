/*


import 'dart:convert';

SubCatModel subCatModelFromJson(String str) => SubCatModel.fromJson(json.decode(str));

String subCatModelToJson(SubCatModel data) => json.encode(data.toJson());

class SubCatModel {
  bool success;
  String message;
  List<subCategory> data;

  SubCatModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SubCatModel.fromJson(Map<String, dynamic> json) => SubCatModel(
    success: json["success"],
    message: json["message"],
    data: List<subCategory>.from(json["data"].map((x) => subCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class subCategory {
  String id;
  String name;

  subCategory({
    required this.id,
    required this.name,
  });

  factory subCategory.fromJson(Map<String, dynamic> json) => subCategory(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}
*/




import 'dart:convert';

SubCatModel subCatModelFromJson(String str) => SubCatModel.fromJson(json.decode(str));

String subCatModelToJson(SubCatModel data) => json.encode(data.toJson());

class SubCatModel {
  bool success;
  String message;
  List<SubCategory> data;

  SubCatModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SubCatModel.fromJson(Map<String, dynamic> json) => SubCatModel(
    success: json["success"],
    message: json["message"],
    data: List<SubCategory>.from(json["data"].map((x) => SubCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class SubCategory {
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

  SubCategory({
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

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
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


class SubSubCategory {
  final String id;
  final String title;

  SubSubCategory({required this.id, required this.title});

  factory SubSubCategory.fromJson(Map<String, dynamic> json) {
    return SubSubCategory(
      id: json["_id"],
      title: json["title"],
    );
  }
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
