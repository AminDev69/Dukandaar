import 'dart:convert';

ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));

String itemModelToJson(ItemModel data) => json.encode(data.toJson());

class ItemModel {
  ItemModel({
    this.name,
    this.price,
    this.image,
    this.quantity,
    this.id,
  });

  String name;
  double price;
  String image;
  String quantity;
  int id;

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        name: json["name"],
        price: json["price"].toDouble(),
        image: json["image"],
        quantity: json["quantity"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "image": image,
        "quantity": quantity,
        "id": id,
      };
}
