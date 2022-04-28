import 'dart:convert';
import 'package:dukandaar/dynamic/models/order_model.dart';
import 'package:http/http.dart';

class OrderRepository {
  //get
  Future<OrderModel> getOrder() async {
    //URL
    Response jsonBody = await get(
      "",
      headers: {"Content-Type": "application/json"},
    );
    // CHECk IF BODY PRESENT BY PRINTING
    print(jsonBody.body);
    // NOW GETTING CONVERTING JSON INTO DART BY CHECKING RESPONSE CODE
    if (jsonBody.statusCode == 200) {
      dynamic dartBody = jsonDecode(jsonBody.body);
      print(dartBody);
      OrderModel orderModel = OrderModel.fromJson(dartBody);
      print(orderModel);
      return orderModel;
    } else {
      throw "can't get user";
    }
  }

  //POST

  Future postorder(OrderModel orderModel) async {
    var jsonBody = jsonEncode(orderModel);
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

  //Update

  Future updateorder(OrderModel orderModel) async {
    var jsonBody = jsonEncode(orderModel);
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
