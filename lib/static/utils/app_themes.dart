import 'package:flutter/material.dart';

class AppTheme {
  static final themes = {
    darkOrLight.lightTheme: ThemeData(
      primaryColor: Color(0xFFE8BD0D),
      primaryColorDark: Color(0xff2d2d2d),
    ),
    darkOrLight.darkTheme: ThemeData(
      primaryColor: Color(0xff2d2d2d),
      primaryColorDark: Color(0xFFE8BD0D),
    ),
  };
}

enum darkOrLight { lightTheme, darkTheme }
