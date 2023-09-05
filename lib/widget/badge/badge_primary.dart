
import 'package:flutter/material.dart';
import 'package:livestreaming/const/colors.dart';
class BadgePrimary extends StatelessWidget {
  String label;
  BadgePrimary({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
      ),
      child: Text(this.label.toString(), style: TextStyle(color: Colors.white, backgroundColor: primaryColor)),
    );
  }
}
