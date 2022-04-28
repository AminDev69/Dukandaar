import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.name,
    this.phone,
    this.address,
    this.uid,
    this.email,
    this.photo,
    this.shop,
    this.id,
  });

  String name;
  String phone;
  String address;
  String uid;
  String email;
  String photo;
  Shop shop;
  int id;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        phone: json["phone"],
        address: json["address"],
        uid: json["uid"],
        email: json["email"],
        photo: json["photo"],
        shop: Shop.fromJson(json["shop"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "address": address,
        "uid": uid,
        "email": email,
        "photo": photo,
        "shop": shop.toJson(),
        "id": id,
      };
}

class Shop {
  Shop();

  factory Shop.fromJson(Map<String, dynamic> json) => Shop();

  Map<String, dynamic> toJson() => {};
}
