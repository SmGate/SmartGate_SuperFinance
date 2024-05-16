// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class TableHeader extends StatelessWidget {
  String text;
  TableHeader({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inder(
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          fontStyle: FontStyle.normal,
          color: HexColor('#262626')),
    );
  }
}
