import 'dart:convert';

import 'item_model.dart';

// import 'package:dukandaar/dynamic/models/item_dummy_model.dart';

DistributorModel distributorModelFromJson(String str) =>
    DistributorModel.fromJson(json.decode(str));

String distributorModelToJson(DistributorModel data) =>
    json.encode(data.toJson());

class DistributorModel {
  DistributorModel({
    this.name,
    this.ownerName,
    this.phone,
    this.nic,
    this.address,
    this.photo,
    this.items,
    this.id,
  });

  String name;
  String ownerName;
  String phone;
  String nic;
  String address;
  String photo;
  List<ItemModel> items;
  int id;

  factory DistributorModel.fromJson(Map<String, dynamic> json) =>
      DistributorModel(
        name: json["name"],
        ownerName: json["ownerName"],
        phone: json["phone"],
        nic: json["nic"],
        address: json["address"],
        photo: json["photo"],
        items: List<ItemModel>.from(json["items"].map((x) => x)),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "ownerName": ownerName,
        "phone": phone,
        "nic": nic,
        "address": address,
        "photo": photo,
        "items": List<ItemModel>.from(items.map((x) => x)),
        "id": id,
      };
}
