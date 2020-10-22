import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.amber.shade50,
    accentColor: Colors.amber,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.green,
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.green,
      ),
    ),
  );
}
