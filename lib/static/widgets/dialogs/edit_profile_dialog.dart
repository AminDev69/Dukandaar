import 'package:dukandaar/static/widgets/buttons/custom_button_medium.dart';
import 'package:flutter/material.dart';
import 'package:dukandaar/static/widgets/custom_toast.dart';
import '../text_fields/custom_icon_textfield.dart';
import 'package:get/get.dart';

class EditProfileDialog extends StatefulWidget {
  String name;
  String email;
  EditProfileDialog({this.name, this.email});

  @override
  State<EditProfileDialog> createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // nameController.text = "";
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    CustomToast _customToast = CustomToast();
    //THEME
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: Column(
          children: [
            CutomIconTextfield(
              name: "Name",
              icon: Icons.person,
              obsecureText: false,
              controller: nameController,
            ),
            SizedBox(height: 15),
            CutomIconTextfield(
              name: "Email",
              icon: Icons.email,
              obsecureText: false,
              controller: emailController,
            ),
            SizedBox(height: 25),
            CustomButtonMedium(
              colorForVerifyButton: true,
              name: "Confirm",
              textColor: theme.primaryColorDark,
              backgroundColor: theme.primaryColor,
              onPressed: () {
                _customToast.showToast("Profile has been edited");
                Get.back();
              },
            )
          ],
        ),
      ),
    );
  }
}
