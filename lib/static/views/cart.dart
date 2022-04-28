import 'package:dukandaar/static/widgets/buttons/custom_button.dart';
import 'package:dukandaar/static/widgets/buttons/custom_button_medium.dart';
import 'package:dukandaar/static/widgets/cards/custom_cart._card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    //THEME
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theme.primaryColor,
        title: Text(
          "Your Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: theme.primaryColorDark,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return CustomCart();
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cart total",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: theme.primaryColorDark),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "23.0",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: theme.primaryColorDark),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discount",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: theme.primaryColorDark),
                      ),
                      Text(
                        "23.0",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: theme.primaryColorDark),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButtonMedium(
                        colorForVerifyButton: true,
                        textColor: theme.primaryColorDark,
                        backgroundColor: theme.primaryColor,
                        name: "Proceed",
                        onPressed: () {
                          Get.snackbar(
                            "Your order ",
                            "has been placed",
                            snackPosition: SnackPosition.BOTTOM,
                            colorText: theme.primaryColor,
                            backgroundColor: theme.primaryColorDark,
                            icon: Icon(
                              Icons.check,
                              color: theme.primaryColor,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
