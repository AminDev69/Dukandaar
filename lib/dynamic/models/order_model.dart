import 'dart:convert';

import 'item_model.dart';

// import 'package:dukandaar/dynamic/models/item_dummy_model.dart';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    this.payment,
    this.orderStatus,
    this.user,
    this.distributor,
    this.items,
    this.id,
  });

  double payment;
  String orderStatus;
  Distributor user;
  Distributor distributor;
  List<ItemModel> items;
  int id;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        payment: json["payment"].toDouble(),
        orderStatus: json["orderStatus"],
        user: Distributor.fromJson(json["user"]),
        distributor: Distributor.fromJson(json["distributor"]),
        items: List<ItemModel>.from(json["items"].map((x) => x)),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "payment": payment,
        "orderStatus": orderStatus,
        "user": user.toJson(),
        "distributor": distributor.toJson(),
        "items": List<ItemModel>.from(items.map((x) => x)),
        "id": id,
      };
}

class Distributor {
  Distributor();

  factory Distributor.fromJson(Map<String, dynamic> json) => Distributor();

  Map<String, dynamic> toJson() => {};
}
