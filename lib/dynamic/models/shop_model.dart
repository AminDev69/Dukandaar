class ShopModel {
  ShopModel({
    this.id,
    this.createdOn,
    this.updatedOn,
    this.updatedBy,
    this.createdBy,
    this.flag,
    this.name,
    this.phone,
    this.address,
  });

  int id;
  dynamic createdOn;
  dynamic updatedOn;
  dynamic updatedBy;
  dynamic createdBy;
  dynamic flag;
  String name;
  dynamic phone;
  dynamic address;

  factory ShopModel.fromJson(Map<String, dynamic> json) => ShopModel(
        id: json["id"],
        createdOn: json["createdOn"],
        updatedOn: json["updatedOn"],
        updatedBy: json["updatedBy"],
        createdBy: json["createdBy"],
        flag: json["flag"],
        name: json["name"],
        phone: json["phone"],
        address: json["address"],
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
        "address": address,
      };
}
