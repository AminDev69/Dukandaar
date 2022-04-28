import 'package:dukandaar/static/views/orders/cancelled/cancelled.dart';
import 'package:dukandaar/static/views/orders/completed/completed.dart';
import 'package:flutter/material.dart';

import 'pending/Pending.dart';

class Orders extends StatefulWidget {
  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    //THEME
    var theme = Theme.of(context);
    // HEIGHT & WIDTH
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: theme.primaryColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: theme.primaryColor,
          bottom: TabBar(
            labelColor: theme.primaryColorDark,
            indicatorColor: theme.primaryColorDark,
            tabs: [
              Tab(text: "Pending", icon: Icon(Icons.pending_sharp)),
              Tab(text: "completed", icon: Icon(Icons.done_all_sharp)),
              Tab(text: "cancelled", icon: Icon(Icons.cancel)),
            ],
          ),
          title: Text(
            "Your Orders",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: theme.primaryColorDark,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Pending(),
            Completed(),
            Cancelled(),
          ],
        ),
      ),
    );
  }
}
