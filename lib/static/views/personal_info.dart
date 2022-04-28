import 'package:dukandaar/static/views/shop_info.dart';
import 'package:flutter/material.dart';

import 'package:dukandaar/static/views/login.dart';
import 'package:dukandaar/static/views/otp.dart';
import 'package:get/get.dart';
import 'package:dukandaar/static/widgets/buttons/custom_button.dart';
import 'package:dukandaar/static/widgets/text_fields/custom_icon_textfield.dart';
import 'package:dukandaar/static/widgets/custom_toast.dart';
import 'package:flutter/material.dart';

class PersonalInfo extends StatefulWidget {
  @override
  State<PersonalInfo> createState() => _PersonalInfo();
}

class _PersonalInfo extends State<PersonalInfo> {
  // CustomColors _colors = CustomColors();
  @override
  Widget build(BuildContext context) {
    CustomToast _customToast = CustomToast();
    //THEME
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Personal Information",
                  style: TextStyle(
                    color: theme.primaryColorDark,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 45.0),
                // CutomIconTextfield(
                //   name: "Username",
                //   icon: Icons.person,
                //   obsecureText: false,
                // ),
                SizedBox(height: 25.0),
                CutomIconTextfield(
                  name: "Name",
                  icon: Icons.email,
                  obsecureText: false,
                ),
                SizedBox(height: 25.0),
                CutomIconTextfield(
                  name: "Nic #",
                  icon: Icons.format_list_numbered,
                  obsecureText: false,
                ),
                SizedBox(height: 35.0),
                CustomButton(
                  name: "Continue",
                  onPressed: () {
                    // _customToast.showToast("Successfully registered");
                    Get.to(ShopInfo());
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
