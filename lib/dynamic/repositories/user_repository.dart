import 'dart:convert';
import 'package:dukandaar/dynamic/models/user_model.dart';
import 'package:http/http.dart';

class UserRepository {
  //getOne
  Future<UserModel> getUser(int id) async {
    //URL
    Response jsonBody = await get(
      "https://dukandaar.herokuapp.com/users/$id",
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

  Future<UserModel> postUser(UserModel userModel) async {
    dynamic json = userModel.toJson();
    var jsonBody = jsonEncode(json);
    //URL
    Response response = await post(
      "https://dukandaar.herokuapp.com/users",
      headers: {"Content-Type": "application/json"},
      body: jsonBody,
    );
    // CHEKC IF BODY PRESENT BY PRINTING......
    print(response.body);
    //OPTIONAL....// if 200 or 201 is present then it will get execute
    if (response.statusCode == 200 || response.statusCode == 201) {
      dynamic dartBody = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(dartBody);
      return user;
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
