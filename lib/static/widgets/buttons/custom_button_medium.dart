// import 'package:dukandaar/static/utils/color.dart';
import 'package:flutter/material.dart';

class CustomButtonMedium extends StatefulWidget {
  String name;
  Function onPressed;
  Color textColor;
  Color backgroundColor;
  bool colorForVerifyButton;
  CustomButtonMedium(
      {this.name,
      this.onPressed,
      this.textColor,
      this.backgroundColor,
      this.colorForVerifyButton});
  @override
  State<CustomButtonMedium> createState() => _CustomButtonMediumState();
}

class _CustomButtonMediumState extends State<CustomButtonMedium> {
  @override
  Widget build(BuildContext context) {
    //THEME
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Material(
      elevation: 10.0,
      // shadowColor: theme.primaryColor,
      borderRadius: BorderRadius.circular(30.0),
      color: widget.colorForVerifyButton == true
          ? theme.primaryColorDark
          : theme.primaryColor,
      child: MaterialButton(
        minWidth: width * 0.5,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15),
        onPressed: widget.onPressed,
        child: Text(
          widget.name,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16.0,
              color: widget.colorForVerifyButton == true
                  ? theme.primaryColor
                  : theme.primaryColorDark),
        ),
      ),
    );
  }
}
