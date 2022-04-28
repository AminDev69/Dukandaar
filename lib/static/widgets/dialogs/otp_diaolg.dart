import 'package:dukandaar/static/views/distributors.dart';
import 'package:dukandaar/static/views/personal_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';

import '../buttons/custom_button_medium.dart';

class OtpDialog extends StatefulWidget {
  @override
  State<OtpDialog> createState() => _OtpDialogState();
}

class _OtpDialogState extends State<OtpDialog> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    var width = MediaQuery.of(context).size.width;
    // set up the AlertDialog

    return Container(
      height: height * 0.21,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: OTPTextField(
              length: 4,
              width: MediaQuery.of(context).size.width,
              otpFieldStyle: OtpFieldStyle(
                backgroundColor: theme.primaryColorDark,
              ),
              fieldWidth: 50,
              style: TextStyle(
                color: theme.primaryColor,
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(height: 30),
          CustomButtonMedium(
            colorForVerifyButton: true,
            name: "verify",
            textColor: theme.primaryColorDark,
            backgroundColor: theme.primaryColor,
            onPressed: () {
              Get.to(PersonalInfo());
            },
          )
        ],
      ),
    );
  }
}
