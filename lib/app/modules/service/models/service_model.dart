// To parse this JSON data, do
//
//     final serviceModel = serviceModelFromJson(jsonString);

import 'dart:convert';

import 'package:colaborae/app/modules/user/models/user_model.dart';

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
  UserModel user;
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
        user: UserModel.fromJson(json["user"]),
        rating: List<dynamic>.from(json["rating"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "deletedAt": deletedAt,
        "active": active,
        "title": title,
        "description": description,
        "value": value,
        "category": category,
        "time": time,
        "user": user.toJson(),
        "rating":
            rating != null ? List<dynamic>.from(rating.map((x) => x)) : null,
      };
}
