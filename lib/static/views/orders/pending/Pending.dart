import 'package:dukandaar/static/views/orders/pending/custom_pending_card.dart';
import 'package:flutter/material.dart';

class Pending extends StatefulWidget {
  @override
  State<Pending> createState() => _PendingState();
}

class _PendingState extends State<Pending> {
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
          return CustomPendingCard();
        },
      ),
    );
  }
}
