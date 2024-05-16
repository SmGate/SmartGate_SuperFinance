import 'package:flutter/material.dart';

Widget myElevatedButton({
  required String text,
  required VoidCallback onPressed,
  double width = double.infinity,
  double height = 50.0,
  Color? backgroundColor,
  Color? textColor,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: backgroundColor,
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
