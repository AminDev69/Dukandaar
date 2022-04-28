// import 'package:dukandaar/dynamic/models/item_dummy_model.dart';
import 'package:dukandaar/dynamic/models/item_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../buttons/custom_small_button.dart';
import '../custom_toast.dart';

class CustomItemCard extends StatefulWidget {
  ItemModel itemModel;
  CustomItemCard({this.itemModel});

  @override
  State<CustomItemCard> createState() => _CustomItemCardState();
}

class _CustomItemCardState extends State<CustomItemCard> {
  // CustomColors _colors = CustomColors();
  @override
  Widget build(BuildContext context) {
    // Toast
    // CustomToast _customToast = CustomToast();
    //THEME
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: theme.primaryColorDark,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset(
                widget.itemModel.image,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 55),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.itemModel.name,
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.itemModel.quantity,
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.itemModel.price.toString(),
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: CustomSmallButton(
                    textColor: theme.primaryColorDark,
                    backgroundColor: theme.primaryColor,
                    name: "Buy",
                    onPressed: () {
                      Get.snackbar(
                        "Added ",
                        " to Cart",
                        snackPosition: SnackPosition.BOTTOM,
                        colorText: theme.primaryColor,
                        backgroundColor: theme.primaryColorDark,
                        icon: Icon(
                          Icons.check,
                          color: theme.primaryColor,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
