// import 'package:dukandaar/static/utils/color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  String name;
  Function onPressed;
  CustomButton({this.name, this.onPressed});
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  // CustomColors _colors = CustomColors();
  @override
  Widget build(BuildContext context) {
    //THEME
    var theme = Theme.of(context);
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: theme.primaryColorDark,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15),
        onPressed: widget.onPressed,
        child: Text(
          widget.name,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20.0, color: theme.primaryColor),
        ),
      ),
    );
  }
}
