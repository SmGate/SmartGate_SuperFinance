import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/styles/colors.dart';

class BillDateHeading extends StatelessWidget {
  final String? title;

  const BillDateHeading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: GoogleFonts.montserrat(
        fontSize: 18.sp,
        color: secondaryColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
