// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:dukandaar/dynamic/models/shop_model.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.createdOn,
    this.updatedOn,
    this.updatedBy,
    this.createdBy,
    this.flag,
    this.name,
    this.phone,
    this.nic,
    this.uid,
    this.email,
    this.photo,
    this.shop,
  });

  int id;
  dynamic createdOn;
  dynamic updatedOn;
  dynamic updatedBy;
  dynamic createdBy;
  dynamic flag;
  String name;
  String phone;
  String nic;
  String uid;
  String email;
  String photo;
  ShopModel shop;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        createdOn: json["createdOn"],
        updatedOn: json["updatedOn"],
        updatedBy: json["updatedBy"],
        createdBy: json["createdBy"],
        flag: json["flag"],
        name: json["name"],
        phone: json["phone"],
        nic: json["nic"],
        uid: json["uid"],
        email: json["email"],
        photo: json["photo"],
        shop: ShopModel.fromJson(json["shop"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdOn": createdOn,
        "updatedOn": updatedOn,
        "updatedBy": updatedBy,
        "createdBy": createdBy,
        "flag": flag,
        "name": name,
        "phone": phone,
        "nic": nic,
        "uid": uid,
        "email": email,
        "photo": photo,
        "shop": shop.toJson(),
      };
}
