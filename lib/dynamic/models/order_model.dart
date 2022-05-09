// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

import 'package:dukandaar/dynamic/models/item_model.dart';
import 'package:dukandaar/dynamic/models/user_model.dart';
import 'package:dukandaar/static/enums/order_status.dart';

import 'distributor_model.dart';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    this.id,
    this.createdOn,
    this.updatedOn,
    this.updatedBy,
    this.createdBy,
    this.flag,
    this.payment,
    this.orderStatus,
    this.user,
    this.distributor,
    this.items,
  });

  int id;
  dynamic createdOn;
  dynamic updatedOn;
  dynamic updatedBy;
  dynamic createdBy;
  dynamic flag;
  double payment;
  OrderStatus orderStatus;
  UserModel user;
  DistributorModel distributor;
  List<ItemModel> items;

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    var list = json["items"] as List;
    List<ItemModel> items = list.map((e) => ItemModel.fromJson(e)).toList();
    return OrderModel(
        id: json["id"],
        createdOn: json["createdOn"],
        updatedOn: json["updatedOn"],
        updatedBy: json["updatedBy"],
        createdBy: json["createdBy"],
        flag: json["flag"],
        payment: json["payment"],
        orderStatus: json["orderStatus"],
        user: UserModel.fromJson(json["user"]),
        distributor: DistributorModel.fromJson(json["distributor"]),
        items: items);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdOn": createdOn,
        "updatedOn": updatedOn,
        "updatedBy": updatedBy,
        "createdBy": createdBy,
        "flag": flag,
        "payment": payment,
        "orderStatus": orderStatus,
        "user": user.toJson(),
        "distributor": distributor.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}
