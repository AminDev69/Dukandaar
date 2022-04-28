import 'package:dukandaar/dynamic/controller/distributor_controller.dart';
import 'package:dukandaar/static/views/navBar.dart';
import 'package:dukandaar/static/widgets/cards/custom_distributor_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Distributors extends StatefulWidget {
  @override
  State<Distributors> createState() => _DistributorsState();
}

class _DistributorsState extends State<Distributors> {
  @override
  Widget build(BuildContext context) {
    final DistributorController distributorController =
        Get.put(DistributorController());
    //THEME
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      drawer: NavBar(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: theme.primaryColor,
        title: Text(
          "Distributors",
          style: TextStyle(
            color: theme.primaryColorDark,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: distributorController.distributorModelList.length,
        itemBuilder: (context, index) {
          return CustomDistributorCard(
              distributorModel:
                  distributorController.distributorModelList[index]);
        },
      ),
    );
  }
}
