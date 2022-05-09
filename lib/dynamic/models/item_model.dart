class ItemModel {
  ItemModel({
    this.id,
    this.createdOn,
    this.updatedOn,
    this.updatedBy,
    this.createdBy,
    this.flag,
    this.name,
    this.price,
    this.image,
    this.quantity,
  });

  int id;
  dynamic createdOn;
  dynamic updatedOn;
  dynamic updatedBy;
  dynamic createdBy;
  dynamic flag;
  String name;
  double price;
  String image;
  String quantity;

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: json["id"],
        createdOn: json["createdOn"],
        updatedOn: json["updatedOn"],
        updatedBy: json["updatedBy"],
        createdBy: json["createdBy"],
        flag: json["flag"],
        name: json["name"],
        price: json["price"].toDouble(),
        image: json["image"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdOn": createdOn,
        "updatedOn": updatedOn,
        "updatedBy": updatedBy,
        "createdBy": createdBy,
        "flag": flag,
        "name": name,
        "price": price,
        "image": image,
        "quantity": quantity,
      };
}
