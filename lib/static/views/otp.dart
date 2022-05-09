import 'dart:ui';

import 'package:dukandaar/static/views/distributors.dart';
// import 'package:dukandaar/static/utils/color.dart';
// import 'package:dukandaar/static/widgets/custom_button.dart';
import 'package:dukandaar/static/widgets/buttons/custom_button.dart';
import 'package:dukandaar/static/widgets/buttons/custom_button_medium.dart';
import 'package:dukandaar/static/widgets/text_fields/custom_icon_textfield.dart';
import 'package:dukandaar/static/widgets/dialogs/otp_diaolg.dart';
// import 'package:dukandaar/static/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
// import 'package:otp_text_field/style.dart';

class OtpScreen extends StatefulWidget {
  String email;
  OtpScreen({this.email});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //THEME
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "OTP",
                  style: TextStyle(
                      color: theme.primaryColorDark,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 60),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CutomIconTextfield(
                      name: "Mobile Number",
                      icon: Icons.phone,
                      keyboardType: TextInputType.number,
                      obsecureText: false,
                    )),
                SizedBox(height: 20.0),
                CustomButton(
                  name: "Sign in with OTP",
                  onPressed: () {
                    Get.defaultDialog(
                        title: "Verify",
                        titleStyle: TextStyle(color: theme.primaryColorDark),
                        backgroundColor: theme.primaryColor,
                        content: OtpDialog(
                          email: widget.email,
                        ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
