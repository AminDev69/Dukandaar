// To parse this JSON data, do
//
//     final distributorModel = distributorModelFromJson(jsonString);

import 'dart:convert';

import 'item_model.dart';

DistributorModel distributorModelFromJson(String str) =>
    DistributorModel.fromJson(json.decode(str));

String distributorModelToJson(DistributorModel data) =>
    json.encode(data.toJson());

class DistributorModel {
  DistributorModel({
    this.id,
    this.createdOn,
    this.updatedOn,
    this.updatedBy,
    this.createdBy,
    this.flag,
    this.name,
    this.ownerName,
    this.phone,
    this.nic,
    this.address,
    this.photo,
    this.items,
  });

  int id;
  dynamic createdOn;
  dynamic updatedOn;
  dynamic updatedBy;
  dynamic createdBy;
  dynamic flag;
  String name;
  String ownerName;
  String phone;
  String nic;
  String address;
  String photo;
  List<ItemModel> items;

  factory DistributorModel.fromJson(Map<String, dynamic> json) {
    var list = json["items"] as List;
    List<ItemModel> items = list.map((e) => ItemModel.fromJson(e)).toList();
    return DistributorModel(
      id: json["id"],
      createdOn: json["createdOn"],
      updatedOn: json["updatedOn"],
      updatedBy: json["updatedBy"],
      createdBy: json["createdBy"],
      flag: json["flag"],
      name: json["name"],
      ownerName: json["ownerName"],
      phone: json["phone"],
      nic: json["nic"],
      address: json["address"],
      photo: json["photo"],
      items: items,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdOn": createdOn,
        "updatedOn": updatedOn,
        "updatedBy": updatedBy,
        "createdBy": createdBy,
        "flag": flag,
        "name": name,
        "ownerName": ownerName,
        "phone": phone,
        "nic": nic,
        "address": address,
        "photo": photo,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}
