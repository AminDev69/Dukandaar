import 'package:dukandaar/static/views/login.dart';
import 'package:dukandaar/static/views/otp.dart';
import 'package:get/get.dart';
import 'package:dukandaar/static/widgets/buttons/custom_button.dart';
import 'package:dukandaar/static/widgets/text_fields/custom_icon_textfield.dart';
import 'package:dukandaar/static/widgets/custom_toast.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
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
                SizedBox(
                  height: 80,
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: theme.primaryColorDark,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
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
                  name: "Email",
                  icon: Icons.email,
                  obsecureText: false,
                ),
                SizedBox(height: 25.0),
                CutomIconTextfield(
                  name: "Password",
                  icon: Icons.remove_red_eye,
                  obsecureText: true,
                ),
                SizedBox(height: 35.0),
                CustomButton(
                  name: "Register",
                  onPressed: () {
                    _customToast.showToast("Successfully registered");
                    Get.to(OtpScreen());
                  },
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "already have an account?",
                      style: TextStyle(color: theme.primaryColorDark),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(Login());
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: theme.primaryColorDark,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: theme.primaryColorDark,
                        height: 36,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "OR CONTINUE WITH",
                      style: TextStyle(color: theme.primaryColorDark),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Divider(
                        color: theme.primaryColorDark,
                        height: 36,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                CustomButton(name: "Google"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
