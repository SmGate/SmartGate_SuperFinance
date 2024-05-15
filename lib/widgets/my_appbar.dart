// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/styles/colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  bool? hasbackButton;
  MyAppBar({super.key, required this.title, this.hasbackButton});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // automaticallyImplyLeading: true,

      backgroundColor: primaryColor,
      title: Text(title!,
          style: GoogleFonts.montserrat(
              color: secondaryColor,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: 36)),

      leading: hasbackButton == true
          ? IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: Colors.white, // Change the color of the back button here
            )
          : SizedBox(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
