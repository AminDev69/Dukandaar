import 'package:dukandaar/static/views/login.dart';
import 'package:dukandaar/static/widgets/buttons/custom_button_medium.dart';
import 'package:dukandaar/static/widgets/text_fields/custom_icon_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutDialog extends StatefulWidget {
  Function onPressed;
  LogoutDialog({this.onPressed});
  @override
  State<LogoutDialog> createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<LogoutDialog> {
  @override
  Widget build(BuildContext context) {
    //THEME
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: widget.onPressed,
              child: Text(
                "Yes",
                style: TextStyle(
                  color: theme.primaryColorDark,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: width * 0.1,
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Text(
                "No",
                style: TextStyle(
                  color: theme.primaryColorDark,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
