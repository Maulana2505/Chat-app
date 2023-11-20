// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Mythemes {
  var darktheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white
    ),
      scaffoldBackgroundColor: Color(0xFF2d2d30),
      brightness: Brightness.dark,
      textTheme: TextTheme(headlineMedium: TextStyle(color: Colors.white),
      labelLarge: TextStyle(color: Colors.black)),
      elevatedButtonTheme : ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        )
      ),
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
      ));

  var lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black
    ),
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    textTheme: TextTheme(headlineMedium: TextStyle(color: Colors.black),
    labelLarge: TextStyle(color: Colors.white)
    ),
    elevatedButtonTheme : ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
        )
      ),
    inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
  );

  void changetheme() {}
}
