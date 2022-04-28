import 'package:dukandaar/dynamic/controller/item_controller.dart';
// import 'package:dukandaar/dynamic/models/item_dummy_model.dart';
// import 'package:dukandaar/static/utils/color.dart';
import 'package:dukandaar/static/widgets/cards/custom_item_card.dart';
// import 'package:dukandaar/static/widgets/item_card.dart';
// import 'package:dukandaar/static/widgets/item_list.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart.dart';

class Items extends StatefulWidget {
  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    final ItemController itemController = Get.put(ItemController());
    //THEME
    var theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.primaryColor,
        onPressed: () {
          Get.to(Cart());
        },
        child: Icon(
          Icons.shopping_cart,
          color: theme.primaryColorDark,
        ),
      ),
      backgroundColor: theme.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Items",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: theme.primaryColorDark,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: itemController.itemModelList.length,
                itemBuilder: (context, index) {
                  return CustomItemCard(
                      itemModel: itemController.itemModelList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
