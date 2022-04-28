// import 'package:dukandaar/static/utils/color.dart';
import 'package:flutter/material.dart';

class CustomSmallButton extends StatefulWidget {
  String name;
  Function onPressed;
  Color textColor;
  Color backgroundColor;
  Icon icon;
  CustomSmallButton(
      {this.name,
      this.onPressed,
      this.backgroundColor,
      this.textColor,
      this.icon});
  @override
  State<CustomSmallButton> createState() => _CustomSmallButtonState();
}

class _CustomSmallButtonState extends State<CustomSmallButton> {
  // CustomColors _colors = CustomColors();
  @override
  Widget build(BuildContext context) {
    //THEME
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(theme.primaryColor),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))),
      onPressed: widget.onPressed,
      child: Text(
        widget.name,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16.0,
          color: theme.primaryColorDark,
        ),
      ),
    );
  }
}
