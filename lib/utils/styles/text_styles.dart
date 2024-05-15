import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle menuTextStyle = GoogleFonts.montserrat(
      color: HexColor('#262626'),
      fontSize: 24,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500);

  static TextStyle midHeading = GoogleFonts.montserrat(
      color: HexColor('#262626'),
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500);
}
