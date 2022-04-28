import 'dart:convert';

ShopModel shopModelFromJson(String str) => ShopModel.fromJson(json.decode(str));

String shopModelToJson(ShopModel data) => json.encode(data.toJson());

class ShopModel {
  ShopModel({
    this.name,
    this.phone,
    this.address,
    this.id,
  });

  String name;
  String phone;
  String address;
  int id;

  factory ShopModel.fromJson(Map<String, dynamic> json) => ShopModel(
        name: json["name"],
        phone: json["phone"],
        address: json["address"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "address": address,
        "id": id,
      };
}
