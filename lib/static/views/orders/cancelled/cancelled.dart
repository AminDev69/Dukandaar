import 'package:dukandaar/static/views/orders/cancelled/custom_cancelled.dart';
import 'package:flutter/material.dart';

class Cancelled extends StatefulWidget {
  @override
  State<Cancelled> createState() => _CancelledState();
}

class _CancelledState extends State<Cancelled> {
  @override
  Widget build(BuildContext context) {
    //THEME
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return CustomCancelledCard();
        },
      ),
    );
  }
}
