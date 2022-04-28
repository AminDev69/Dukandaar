import 'package:flutter/material.dart';

import 'custom_completed.dart';

class Completed extends StatefulWidget {
  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
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
          return CustomCompletedCard();
        },
      ),
    );
  }
}
