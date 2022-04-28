// import 'package:dukandaar/static/views/items.dart';
import 'package:dukandaar/static/widgets/buttons/custom_small_button.dart';
import 'package:dukandaar/static/widgets/dialogs/logout_dialog.dart';
import 'package:dukandaar/static/widgets/dialogs/see_items_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

// import '../../../widgets/buttons/custom_button_medium.dart';

class CustomCompletedCard extends StatefulWidget {
  @override
  State<CustomCompletedCard> createState() => _CustomCompletedCardState();
}

class _CustomCompletedCardState extends State<CustomCompletedCard> {
  @override
  Widget build(BuildContext context) {
    LogoutDialog _logout = LogoutDialog();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //THEME
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Container(
        // height: height * 0.31,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: theme.primaryColorDark,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 0.2, left: 8),
                              child: Text(
                                'Azeem & CO',
                                style: TextStyle(
                                  color: theme.primaryColor,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8, bottom: 8),
                              child: Text(
                                "Payment  : ",
                                style: TextStyle(
                                  color: theme.primaryColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomSmallButton(
                        textColor: theme.primaryColorDark,
                        backgroundColor: theme.primaryColor,
                        name: "See Items",
                        onPressed: () {
                          Get.defaultDialog(
                            title: "",
                            cancel: CustomSmallButton(
                              name: 'CANCEL',
                              onPressed: () {
                                Get.back();
                              },
                            ),
                            backgroundColor: theme.primaryColor,
                            content: SeeItemsDialog(),
                          );
                        },
                      ),
                      // CustomSmallButton(
                      //   // colorForVerifyButton: false,
                      //   textColor: theme.primaryColorDark,
                      //   backgroundColor: theme.primaryColor,
                      //   name: "Cancel",
                      //   onPressed: () {
                      //     Get.defaultDialog(
                      //         title: "Are You sure ?",
                      //         titleStyle: TextStyle(
                      //           fontSize: 20,
                      //           color: theme.primaryColorDark,
                      //         ),
                      //         backgroundColor: theme.primaryColor,
                      //         content: LogoutDialog(
                      //           onPressed: () {
                      //             Get.back();
                      //           },
                      //         ));
                      //   },
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
