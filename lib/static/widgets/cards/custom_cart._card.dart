import 'package:flutter/material.dart';

class CustomCart extends StatefulWidget {
  @override
  State<CustomCart> createState() => _CustomCartState();
}

class _CustomCartState extends State<CustomCart> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10.0,
        color: theme.primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 75.0,
                width: 45.0,
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: theme.primaryColorDark),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.add,
                        color: theme.primaryColorDark,
                      ),
                    ),
                    Text(
                      "0",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: theme.primaryColorDark,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.remove,
                        color: theme.primaryColorDark,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.05,
              ),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/slanty_vegetable.jpg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(35.0),
                  boxShadow: [
                    BoxShadow(
                      color: theme.primaryColorDark,
                      // blurRadius: 0.0,
                      // offset: Offset(5.0, 5.0),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.06,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Slanty',
                    style: TextStyle(
                        color: theme.primaryColorDark,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    '30',
                    style: TextStyle(
                        color: theme.primaryColorDark, fontSize: 16.0),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    height: 45.0,
                    width: 120.0,
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                          child: Row(
                            children: [
                              Text(
                                'Slanty',
                                style: TextStyle(
                                  color: theme.primaryColorDark,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.cancel,
                  color: theme.primaryColorDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
