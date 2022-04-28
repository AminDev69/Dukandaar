import 'dart:io';

import 'package:dukandaar/dynamic/bloc/theme/theme_bloc.dart';
import 'package:dukandaar/static/views/orders/orders.dart';
import 'package:dukandaar/static/utils/app_themes.dart';
import 'package:dukandaar/static/utils/theme_preference.dart';
import 'package:dukandaar/static/widgets/buttons/custom_button_medium.dart';
import 'package:dukandaar/static/widgets/dialogs/edit_shop_dialog.dart';
import 'package:dukandaar/static/widgets/dialogs/logout_dialog.dart';
import 'package:dukandaar/static/widgets/text_fields/custom_icon_textfield.dart';
import 'package:dukandaar/static/widgets/buttons/custom_small_button.dart';
import 'package:dukandaar/static/widgets/custom_toast.dart';
import 'package:dukandaar/static/widgets/dialogs/edit_profile_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'orders/orders.dart';

// ignore: must_be_immutable
class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  _setTheme(bool darkTheme) async {
    darkOrLight selectedTheme =
        darkTheme ? darkOrLight.lightTheme : darkOrLight.darkTheme;
    BlocProvider.of<ThemeBloc>(context)
        .add(ChangeEvent(myTheme: selectedTheme));
    ThemePreferences.saveTheme(selectedTheme);
  }

  File _image;

  Future getImage() async {
    final image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  Future getImageCamera() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    //THEME
    var theme = Theme.of(context);
    return Drawer(
      child: Container(
        color: theme.primaryColor,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "Dukandaar.com",
                style: TextStyle(
                  color: theme.primaryColorDark,
                ),
              ),
              accountEmail: Text(
                "Dukandaar@gmail.com",
                style: TextStyle(
                  color: theme.primaryColorDark,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                child: Container(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: theme.primaryColorDark,
                          borderRadius: BorderRadius.circular(100)),
                      child: GestureDetector(
                        onTap: () {
                          bottomsheets(
                              context: context,
                              onPressedCamera: () {
                                getImage();
                              },
                              onPressedGallery: () {
                                getImageCamera();
                              });
                        },
                        child: Icon(
                          Icons.edit,
                          size: 18,
                          color: theme.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        image: AssetImage('assets/user_profile.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: theme.primaryColorDark,
              ),
              title: Text(
                "Edit profile",
                style: TextStyle(
                  color: theme.primaryColorDark,
                ),
              ),
              onTap: () {
                Get.defaultDialog(
                    title: "Edit Profile",
                    titleStyle: TextStyle(
                      fontSize: 20,
                      color: theme.primaryColorDark,
                    ),
                    backgroundColor: theme.primaryColor,
                    content: EditProfileDialog());
              },
            ),
            ListTile(
              leading: Icon(
                Icons.book,
                color: theme.primaryColorDark,
              ),
              title: Text(
                "My orders",
                style: TextStyle(
                  color: theme.primaryColorDark,
                ),
              ),
              onTap: () {
                Get.to(Orders());
              },
            ),
            ListTile(
              leading: Icon(
                Icons.storefront,
                color: theme.primaryColorDark,
              ),
              title: Text(
                "Edit Shop",
                style: TextStyle(
                  color: theme.primaryColorDark,
                ),
              ),
              onTap: () {
                Get.defaultDialog(
                    title: "Edit Shop",
                    titleStyle: TextStyle(
                      fontSize: 20,
                      color: theme.primaryColorDark,
                    ),
                    backgroundColor: theme.primaryColor,
                    content: EditShopDialog());
              },
            ),
            ListTile(
              leading: Icon(
                Icons.palette,
                color: theme.primaryColorDark,
              ),
              title: Text(
                "Change theme",
                style: TextStyle(
                  color: theme.primaryColorDark,
                ),
              ),
              trailing: Switch(
                  activeColor: theme.primaryColorDark,
                  activeTrackColor: theme.primaryColorDark,
                  inactiveTrackColor: theme.primaryColorDark,
                  inactiveThumbColor: theme.primaryColorDark,
                  value: ThemePreferences.getTheme() == darkOrLight.lightTheme,
                  onChanged: (val) {
                    _setTheme(val);
                  }),
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: theme.primaryColorDark,
              ),
              title: Text(
                "Logout",
                style: TextStyle(
                  color: theme.primaryColorDark,
                ),
              ),
              onTap: () {
                Get.defaultDialog(
                    title: "Are You sure ?",
                    titleStyle: TextStyle(
                      fontSize: 20,
                      color: theme.primaryColorDark,
                    ),
                    backgroundColor: theme.primaryColor,
                    content: LogoutDialog());
              },
            ),
          ],
        ),
      ),
    );
  }
}

bottomsheets({context, Function onPressedCamera, Function onPressedGallery}) {
  var theme = Theme.of(context);
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (contex) => Container(
            height: height * 0.14,
            decoration: BoxDecoration(
                color: theme.primaryColorDark,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomSmallButton(
                  name: "Camera",
                  // icon: Icon(Icons.camera),
                  onPressed: onPressedCamera,
                ),
                SizedBox(width: width * 0.2),
                CustomSmallButton(
                  name: "Gallery",
                  // icon: Icon(Icons.camera),
                  onPressed: onPressedGallery,
                )
              ],
            ),
          ));
}

// showAlertDialog(BuildContext context) {
//   CustomToast _customToast = CustomToast();
//   //THEME
//   var theme = Theme.of(context);
//   var height = MediaQuery.of(context).size.height;
//   // ignore: unused_local_variable
//   var width = MediaQuery.of(context).size.width;
//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Center(
//       child: Text(
//         "Edit Profile",
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//           color: theme.primaryColorDark,
//         ),
//       ),
//     ),
//     content: Container(
//       height: height * 0.28,
//       child: Column(
//         children: [
//           CutomIconTextfield(
//             name: "Name",
//             icon: Icons.person,
//             obsecureText: false,
//           ),
//           SizedBox(height: 15),
//           CutomIconTextfield(
//             name: "Email",
//             icon: Icons.email,
//             obsecureText: false,
//           ),
//           SizedBox(height: 22),
//           CustomButtonMedium(
//             colorForVerifyButton: true,
//             name: "Edit Profile",
//             textColor: theme.primaryColorDark,
//             backgroundColor: theme.primaryColor,
//             onPressed: () {
//               _customToast.showToast("Profile has been edited");
//               Navigator.pop(context);
//             },
//           )
//         ],
//       ),
//     ),
//     actionsPadding: EdgeInsets.only(right: 85),
//     // actions: [verifyButton],
//     backgroundColor: theme.primaryColor,
//   );

//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }

showAlertDialog1(BuildContext context) {
  CustomToast _customToast = CustomToast();
  //THEME
  var theme = Theme.of(context);
  var height = MediaQuery.of(context).size.height;
  // ignore: unused_local_variable
  var width = MediaQuery.of(context).size.width;
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Center(
      child: Text(
        "Are you sure ? ",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: theme.primaryColorDark,
        ),
      ),
    ),
    content: Container(
      // height: height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [],
      ),
    ),
    // actionsPadding: EdgeInsets.all(8),
    actions: [
      GestureDetector(
        onTap: () {},
        child: Text(
          "Yes",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: theme.primaryColorDark,
              fontSize: 20),
        ),
      ),
      SizedBox(
        width: 20,
      ),
      GestureDetector(
        onTap: () {},
        child: Text(
          "No",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: theme.primaryColorDark,
              fontSize: 20),
        ),
      ),
    ],
    backgroundColor: theme.primaryColor,
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
