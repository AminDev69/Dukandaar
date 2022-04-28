// import 'package:dukandaar/dynamic/models/distributor_dummy_model.dart';
// import 'package:dukandaar/dynamic/models/distributor_model.dart';
// import 'package:dukandaar/dynamic/models/order_model.dart';
import 'package:dukandaar/dynamic/repositories/distributor_repository.dart';
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DistributorController extends GetxController {
  // GETALL
  var distributorModelList = [].obs;

  DistributorRepository distributorRepository = DistributorRepository();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchDistributors();
  }

  void fetchDistributors() async {
    var distributors = await distributorRepository.getAllDistributor();
    if (distributors != null) {
      distributorModelList(distributors);
    }
  }
}
