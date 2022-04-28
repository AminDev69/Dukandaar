import 'package:dukandaar/static/views/login.dart';
// import 'package:dukandaar/static/screens/orders/see_items.dart';
import 'package:dukandaar/static/widgets/buttons/custom_button_medium.dart';
import 'package:dukandaar/static/widgets/dialogs/logout_dialog.dart';
import 'package:dukandaar/static/widgets/text_fields/custom_icon_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeeItemsDialog extends StatefulWidget {
  @override
  State<SeeItemsDialog> createState() => _SeeItemsDialogState();
}

class _SeeItemsDialogState extends State<SeeItemsDialog> {
  @override
  Widget build(BuildContext context) {
    //THEME
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.2,
      child: Expanded(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Center(
              child: Text(
                "data",
                style: TextStyle(color: theme.primaryColorDark, fontSize: 18),
              ),
            );
          },
        ),
      ),
    );
  }
}
