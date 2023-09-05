import 'package:flutter/material.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    textTheme: const TextTheme(
      // titleSmall: TextStyle(color: Color(0xffEA6D2B), fontWeight: FontWeight.normal, fontSize: 10),
      // titleMedium: TextStyle(color: Color(0xffEA6D2B), fontWeight: FontWeight.bold, fontSize: 14),
      // titleLarge: TextStyle(color: Color(0xffEA6D2B), fontWeight: FontWeight.bold, fontSize: 18),
      displaySmall: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
      displayMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      displayLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xff141414)),
    inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        focusColor: Colors.white,
        filled: true,
        fillColor: Colors.black12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
        )),
  );
  final darkTheme = ThemeData.dark().copyWith(

  );
}
