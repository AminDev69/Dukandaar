import 'dart:convert';
// import 'package:dukandaar/dynamic/models/order_model.dart';
import 'package:http/http.dart';
import 'package:dukandaar/dynamic/models/distributor_model.dart';

class DistributorRepository {
  //getAll
  Future<List<DistributorModel>> getAllDistributor() async {
    //URL
    Response jsonBodyList = await get(
      "https://dukandaar.herokuapp.com/distributors",
      headers: {"Content-Type": "application/json"},
    );
    // CHECk IF BODY PRESENT BY PRINTING
    print(jsonBodyList.body);
    // NOW GETTING CONVERTING JSON INTO DART BY CHECKING RESPONSE CODE
    if (jsonBodyList.statusCode == 200) {
      List<dynamic> dartBodyList = jsonDecode(jsonBodyList.body);
      print(dartBodyList);
      // NOW SETTING THIS DART BODY IN  LIST OF MODELS....
      List<DistributorModel> distributorModelList = dartBodyList
          .map((dynamic distributorModelList) =>
              DistributorModel.fromJson(distributorModelList))
          .toList();

      print(distributorModelList);
      return distributorModelList;
    } else {
      throw "can't get distributor";
    }
  }

  // //POST

  // Future postDistributor(DistributorModel distributor) async {
  //   var disJson = jsonEncode(distributor);
  //   //URL
  //   Response response = await post(
  //     "",
  //     headers: {"Content-Type": "application/json"},
  //     body: disJson,
  //   );
  //   // CHEKC IF BODY PRESENT BY PRINTING
  //   print(response.body);
  //   //OPTIONAL
  //   if (response.statusCode == 200) {
  //     print("posted !!!");
  //   } else {
  //     throw "can't post user";
  //   }
  // }

  // //Update

  // Future updateDistributor(DistributorModel distributor) async {
  //   var disJson = jsonEncode(distributor);
  //   //URL
  //   Response response = await put(
  //     "",
  //     headers: {"Content-Type": "application/json"},
  //     body: disJson,
  //   );
  //   // CHEKC IF BODY PRESENT BY PRINTING
  //   print(response.body);
  //   //OPTIONAL
  //   if (response.statusCode == 200) {
  //     print("posted !!!");
  //   } else {
  //     throw "can't post user";
  //   }
  // }

  // //delete

  // Future deleteDistrbutor(int id) async {
  //   //URL
  //   Response response = await delete(
  //     "https://side-hospital-975.herokuapp.com/doctor/$id",
  //     headers: {"Content-Type": "application/json"},
  //   );

  //   if (response.statusCode == 200) {
  //     print("posted !!!");
  //   } else {
  //     throw "can't post user";
  //   }
  // }
}
