import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:livestreaming/const/colors.dart';
import 'package:livestreaming/views/screens/home_screen.dart';
import 'package:livestreaming/views/screens/login_screen.dart';
import 'package:livestreaming/views/screens/register_screen.dart';
import 'package:livestreaming/views/screens/todo_screen.dart';

import 'package:appwrite/appwrite.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      child: GetMaterialApp(
        title: 'Live Streming App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.white,
            textTheme: const TextTheme(
              // titleSmall: TextStyle(color: Color(0xffEA6D2B), fontWeight: FontWeight.normal, fontSize: 10),
              // titleMedium: TextStyle(color: Color(0xffEA6D2B), fontWeight: FontWeight.bold, fontSize: 14),
              // titleLarge: TextStyle(color: Color(0xffEA6D2B), fontWeight: FontWeight.bold, fontSize: 18),
              displaySmall: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
              displayMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16,),
              displayLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            iconTheme: IconThemeData(color: Colors.white),
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
                backgroundColor: Color(0xff141414)
            ),
            inputDecorationTheme:InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                focusColor: Colors.white,
                filled: true,
                fillColor: Colors.black12,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                )
            )
        ),
        home: RegisterScreen(),
      ),
    );
  }
}
