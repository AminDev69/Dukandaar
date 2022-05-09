import 'package:dukandaar/dynamic/bloc/user/user_bloc.dart';
import 'package:dukandaar/dynamic/models/shop_model.dart';
import 'package:dukandaar/dynamic/models/user_model.dart';
import 'package:dukandaar/static/views/loader.dart';
import 'package:dukandaar/static/views/shop_info.dart';
import 'package:dukandaar/static/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dukandaar/static/widgets/buttons/custom_button.dart';
import 'package:dukandaar/static/widgets/text_fields/custom_icon_textfield.dart';

class PersonalInfo extends StatefulWidget {
  String email;
  PersonalInfo({this.email});
  @override
  State<PersonalInfo> createState() => _PersonalInfo();
}

class _PersonalInfo extends State<PersonalInfo> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nicController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //THEME
    var theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.primaryColor,
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<UserBloc, UserState>(builder: (context, state) {
          if (state is UserInitial || state is UserFailure) {
            return Center(
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
                      SizedBox(height: 25.0),
                      CutomIconTextfield(
                        name: "Name",
                        icon: Icons.email,
                        obsecureText: false,
                        controller: nameController,
                      ),
                      SizedBox(height: 25.0),
                      CutomIconTextfield(
                        name: "Nic #",
                        icon: Icons.format_list_numbered,
                        obsecureText: false,
                        controller: nicController,
                      ),
                      SizedBox(height: 35.0),
                      CustomButton(
                        name: "Continue",
                        onPressed: () {
                          UserModel user = UserModel(
                              name: nameController.text,
                              nic: nicController.text,
                              email: widget.email,
                              shop: ShopModel());
                          // this line is use for calling an event and it remains smae in all cases
                          BlocProvider.of<UserBloc>(context)
                              .add(PostUserEvent(user));
                          // Get.to(ShopInfo());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is UserLoading) {
            return Loader();
          } else if (state is UserLoaded) {
            return ShopInfo(
              userModel: state.userModel,
            );
          }
          return Container();
        }, listener: (context, state) {
          if (state is UserFailure) {
            return CustomToast().showToast(state.error);
          }
        }));
  }
}
