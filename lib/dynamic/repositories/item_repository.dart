import 'dart:convert';

import 'package:dukandaar/dynamic/models/item_model.dart';
import 'package:http/http.dart';

class ItemRepository {
  //getAll
  Future<List<ItemModel>> getAllItems() async {
    //URL
    Response jsonBodyList = await get(
      "",
      headers: {"Content-Type": "application/json"},
    );
    // CHECk IF BODY PRESENT BY PRINTING
    print(jsonBodyList.body);
    // NOW GETTING CONVERTING JSON INTO DART BY CHECKING RESPONSE CODE
    if (jsonBodyList.statusCode == 200) {
      List<dynamic> dartBodyList = jsonDecode(jsonBodyList.body);
      print(dartBodyList);
      List<ItemModel> itemModelList = dartBodyList
          .map((dynamic itemModelList) => ItemModel.fromJson(itemModelList))
          .toList();
      print(itemModelList);
      return itemModelList;
    } else {
      throw "can't get user";
    }
  }
}
