import 'dart:convert';
import 'package:dukandaar/dynamic/models/user_model.dart';
import 'package:http/http.dart';

class UserRepository {
  //getOne
  Future<UserModel> getUser() async {
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
      UserModel userModel = UserModel.fromJson(dartBody);
      print(userModel);
      return userModel;
    } else {
      throw "can't get user";
    }
  }

  //POST

  Future postUser(UserModel userModel) async {
    var jsonBody = jsonEncode(userModel);
    //URL
    Response response = await post(
      "",
      headers: {"Content-Type": "application/json"},
      body: jsonBody,
    );
    // CHEKC IF BODY PRESENT BY PRINTING......
    print(response.body);
    //OPTIONAL....
    if (response.statusCode == 200) {
      print("posted !!!");
    } else {
      throw "can't post user";
    }
  }

  //Update/Put

  Future updateUser(UserModel userModel) async {
    var jsonBody = jsonEncode(userModel);
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
