import 'package:flutter/material.dart';
import 'package:livestreaming/const/colors.dart';

class ButtonSmall extends StatelessWidget {
  String label;
  Color color;
  VoidCallback callBack;

  ButtonSmall({super.key, required this.label, required this.color, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor
      ),
      onPressed: this.callBack,
      child: Text(this.label, style: TextStyle(color: this.color, fontSize: 10)),
    );
  }
}
