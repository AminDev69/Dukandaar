import 'dart:convert';
import 'package:dukandaar/dynamic/models/shop_model.dart';
import 'package:http/http.dart';

class ShopRepository {
  //POST
  Future postshop(ShopModel shopModel) async {
    var jsonBody = jsonEncode(shopModel);
    //URL
    Response response = await post(
      "",
      headers: {"Content-Type": "application/json"},
      body: jsonBody,
    );
    // CHEKC IF BODY PRESENT BY PRINTING
    print(response.body);
    //OPTIONAL
    if (response.statusCode == 200) {
      print("posted !!!");
    } else {
      throw "can't post user";
    }
  }

  //Update/Put

  Future updateshop(ShopModel shopModel) async {
    var jsonBody = jsonEncode(shopModel);
    //URL
    Response response = await put(
      "",
      headers: {"Content-Type": "application/json"},
      body: jsonBody,
    );
    // CHEKC IF BODY PRESENT BY PRINTING
    print(response.body);
    //OPTIONAL
    if (response.statusCode == 200) {
      print("posted !!!");
    } else {
      throw "can't post user";
    }
  }
}
