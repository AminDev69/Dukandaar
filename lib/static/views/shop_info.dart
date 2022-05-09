import 'package:dukandaar/dynamic/bloc/shop/shop_bloc.dart';
import 'package:dukandaar/dynamic/bloc/user/user_bloc.dart';
import 'package:dukandaar/dynamic/models/shop_model.dart';
import 'package:dukandaar/dynamic/models/user_model.dart';
import 'package:dukandaar/static/views/distributors.dart';
import 'package:dukandaar/static/views/loader.dart';
import 'package:flutter/material.dart';

import 'package:dukandaar/static/views/login.dart';
import 'package:dukandaar/static/views/otp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:dukandaar/static/widgets/buttons/custom_button.dart';
import 'package:dukandaar/static/widgets/text_fields/custom_icon_textfield.dart';
import 'package:dukandaar/static/widgets/custom_toast.dart';
import 'package:flutter/material.dart';

class ShopInfo extends StatefulWidget {
  UserModel userModel;
  ShopInfo({this.userModel});
  @override
  State<ShopInfo> createState() => _ShopInfo();
}

class _ShopInfo extends State<ShopInfo> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  // CustomColors _colors = CustomColors();
  @override
  Widget build(BuildContext context) {
    // CustomToast _customToast = CustomToast();
    //THEME
    var theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.primaryColor,
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<ShopBloc, ShopState>(
          builder: (context, state) {
            if (state is ShopInitial || state is ShopFailure) {
              return Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Shop Information",
                          style: TextStyle(
                            color: theme.primaryColorDark,
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 45.0),
                        CutomIconTextfield(
                          name: "Name",
                          icon: Icons.person,
                          obsecureText: false,
                        ),
                        SizedBox(height: 25.0),
                        CutomIconTextfield(
                          name: "Phone",
                          keyboardType: TextInputType.number,
                          icon: Icons.phone,
                          obsecureText: false,
                        ),
                        SizedBox(height: 25.0),
                        CutomIconTextfield(
                          name: "Address",
                          icon: Icons.pin_drop,
                          obsecureText: false,
                        ),
                        SizedBox(height: 35.0),
                        CustomButton(
                          name: "Submit",
                          onPressed: () {
                            ShopModel shop = ShopModel(
                              name: nameController.text,
                              phone: phoneController.text,
                              address: addressController.text,
                            );

                            BlocProvider.of<ShopBloc>(context)
                                .add(PostShopEvent(shop, widget.userModel.id));
                            BlocProvider.of<UserBloc>(context)
                                .add(GetUserEvent(widget.userModel.id));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is ShopLoading) {
              return Loader();
            } else if (state is ShopLoaded) {
              return Distributors();
            }
            return Container();
          },
          listener: (context, state) {
            if (state is ShopFailure) {
              return CustomToast().showToast(state.error);
            }
          },
        ));
  }
}
