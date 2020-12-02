// To parse this JSON data, do
//
//     final serviceModel = serviceModelFromJson(jsonString);

import 'dart:convert';

ServiceModel serviceModelFromJson(String str) =>
    ServiceModel.fromJson(json.decode(str));

String serviceModelToJson(ServiceModel data) => json.encode(data.toJson());

class ServiceModel {
  ServiceModel({
    this.uuid,
    this.createAt,
    this.modifiedAt,
    this.deletedAt,
    this.active,
    this.title,
    this.description,
    this.value,
    this.category,
    this.time,
    this.user,
    this.rating,
  });

  String uuid;
  DateTime createAt;
  DateTime modifiedAt;
  dynamic deletedAt;
  bool active;
  String title;
  String description;
  double value;
  String category;
  DateTime time;
  User user;
  List<dynamic> rating;

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        uuid: json["uuid"],
        createAt: DateTime.parse(json["createAt"]),
        modifiedAt: DateTime.parse(json["modifiedAt"]),
        deletedAt: json["deletedAt"],
        active: json["active"],
        title: json["title"],
        description: json["description"],
        value: json["value"],
        category: json["category"],
        time: json["time"],
        user: User.fromJson(json["user"]),
        rating: List<dynamic>.from(json["rating"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "createAt": createAt.toIso8601String(),
        "modifiedAt": modifiedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "active": active,
        "title": title,
        "description": description,
        "value": value,
        "category": category,
        "time": time,
        "user": user.toJson(),
        "rating": List<dynamic>.from(rating.map((x) => x)),
      };
}

class User {
  User({
    this.uuid,
    this.createAt,
    this.modifiedAt,
    this.deletedAt,
    this.active,
    this.firstName,
    this.lastName,
    this.email,
    this.document,
    this.address,
    this.description,
    this.favorites,
  });

  String uuid;
  dynamic createAt;
  dynamic modifiedAt;
  dynamic deletedAt;
  bool active;
  dynamic firstName;
  dynamic lastName;
  dynamic email;
  dynamic document;
  dynamic address;
  dynamic description;
  List<dynamic> favorites;

  factory User.fromJson(Map<String, dynamic> json) => User(
        uuid: json["uuid"],
        createAt: json["createAt"],
        modifiedAt: json["modifiedAt"],
        deletedAt: json["deletedAt"],
        active: json["active"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        document: json["document"],
        address: json["address"],
        description: json["description"],
        favorites: List<dynamic>.from(json["favorites"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "createAt": createAt,
        "modifiedAt": modifiedAt,
        "deletedAt": deletedAt,
        "active": active,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "document": document,
        "address": address,
        "description": description,
        "favorites": List<dynamic>.from(favorites.map((x) => x)),
      };
}
