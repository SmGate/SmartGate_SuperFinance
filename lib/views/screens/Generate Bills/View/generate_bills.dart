// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_finance/utils/images.dart';
import 'package:super_finance/views/screens/Society%20Apartment%20Bills/View/generate_society_apartment_bills.dart';
import '../../../../utils/styles/colors.dart';
import '../../../../widgets/my_appbar.dart';
import '../../House Bills/View/generate_house_bill.dart';
import '../Controller/bills_controller.dart';

class GenerateBills extends StatelessWidget {
  const GenerateBills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GenerateBillController>(
        init: GenerateBillController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              appBar: MyAppBar(
                title: 'Generate Bill',
                hasbackButton: true,
              ),
              body: Padding(
                padding: EdgeInsets.only(left: 104.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 57,
                      ),
                      Text(
                        "Smart Billing Solutions for\nApartments and Houses",
                        style: GoogleFonts.montserrat(
                            color: secondaryColor,
                            fontSize: 40.sp,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 72,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GenerateBillCard(
                            text: "house bills",
                            imgUrl: AppImages.monthlyBill,
                            onTap: () {
                              Get.to(() => GenerateHouseBill());
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GenerateBillCard(
                            text: "Apartment Bill",
                            imgUrl: AppImages.individualBill,
                            onTap: () {
                              Get.to(() => GenerateSocietyApartmentBills());
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class GenerateBillCard extends StatelessWidget {
  final String? text;
  final String? imgUrl;
  void Function()? onTap;

  GenerateBillCard(
      {super.key, required this.text, required this.imgUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 340.w,
        height: 200.w,
        child: Card(
          elevation: 0.8,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                text!,
                style: GoogleFonts.montserrat(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                imgUrl!,
                width: 100.w,
                height: 100.w,
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
