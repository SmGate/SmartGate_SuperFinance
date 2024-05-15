import 'package:flutter/material.dart';
import 'package:super_finance/utils/styles/text_styles.dart';

Widget menuWidget(String img, String title, Function onpressed) {
  return GestureDetector(
    onTap: () {
      onpressed();
    },
    child: SizedBox(
      height: 300,
      width: 300,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              img,
              height: 150,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(title, style: AppTextStyles.menuTextStyle),
          ],
        ),
      ),
    ),
  );
}
