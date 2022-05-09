// import 'package:dukandaar/dynamic/models/distributor_dummy_model.dart';
import 'package:dukandaar/dynamic/bloc/item/item_bloc.dart';
import 'package:dukandaar/dynamic/models/distributor_model.dart';
import 'package:dukandaar/static/views/items.dart';
// import 'package:dukandaar/static/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../buttons/custom_button_medium.dart';

class CustomDistributorCard extends StatefulWidget {
  DistributorModel distributorModel;

  CustomDistributorCard({this.distributorModel});

  @override
  State<CustomDistributorCard> createState() => _CustomDistributorCardState();
}

class _CustomDistributorCardState extends State<CustomDistributorCard> {
  // CustomColors _colors = CustomColors();
  @override
  Widget build(BuildContext context) {
    //THEME
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: theme.primaryColorDark,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                widget.distributorModel.name,
                                style: TextStyle(
                                  color: theme.primaryColor,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Name : ${widget.distributorModel.ownerName}",
                                style: TextStyle(
                                  color: theme.primaryColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Phone : ${widget.distributorModel.phone}",
                                style: TextStyle(
                                  color: theme.primaryColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Address : ${widget.distributorModel.address}",
                                style: TextStyle(
                                  color: theme.primaryColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CustomButtonMedium(
                          colorForVerifyButton: false,
                          textColor: theme.primaryColorDark,
                          backgroundColor: theme.primaryColor,
                          name: "Items",
                          onPressed: () {
                            BlocProvider.of<ItemBloc>(context)
                                .add(GetItemEvent());
                            Get.to(Items());
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
