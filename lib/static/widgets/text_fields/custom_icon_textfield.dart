// import 'package:dukandaar/static/utils/color.dart';
import 'package:flutter/material.dart';

class CutomIconTextfield extends StatefulWidget {
  String name;
  IconData icon;
  bool obsecureText;
  final TextInputType keyboardType;
  TextEditingController controller;

  CutomIconTextfield(
      {this.name,
      this.icon,
      this.keyboardType,
      this.obsecureText,
      this.controller});
  @override
  State<CutomIconTextfield> createState() => _CutomIconTextfieldState();
}

class _CutomIconTextfieldState extends State<CutomIconTextfield> {
  // CustomColors _colors = CustomColors();
  @override
  Widget build(BuildContext context) {
    //THEME
    var theme = Theme.of(context);
    return TextField(
      keyboardType: widget.keyboardType,
      obscureText: widget.obsecureText,
      cursorColor: theme.primaryColorDark,
      controller: widget.controller,
      style: TextStyle(
        fontSize: 18.0,
        color: theme.primaryColorDark,
      ),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          fillColor: theme.primaryColor,
          labelText: widget.name,
          // hintText: widget.name,
          // hintStyle: TextStyle(color: Colors.grey[700]),
          labelStyle: TextStyle(
            color: theme.primaryColorDark,
          ),
          suffixIcon: Icon(widget.icon, color: theme.primaryColorDark),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.primaryColorDark,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.primaryColorDark,
            ),
            borderRadius: BorderRadius.circular(20.0),
          )),
    );
  }
}
