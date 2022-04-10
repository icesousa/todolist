import 'package:flutter/material.dart';
import 'package:todolist/pages/constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    primaryColor: kPrimarycolor,
    textTheme: textTheme(),
  );
}

TextTheme textTheme() {
  return TextTheme(
      bodyText1: TextStyle(color: kTextColor),
      bodyText2: TextStyle(color: kTextColor));
}
