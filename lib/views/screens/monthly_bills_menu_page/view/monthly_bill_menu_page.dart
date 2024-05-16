// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:super_finance/utils/images.dart';
import 'package:super_finance/views/screens/monthly_bill_detail/views/bill_details_main_page.dart';
import '../../../../widgets/my_appbar.dart';
import '../../Generate Bills/View/generate_bills.dart';
import '../controller/monthly_bill_menu_page_controller.dart';
import 'monthly_bill_date_settings.dart';

class MonthlyBillMenuPage extends StatelessWidget {
  const MonthlyBillMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    var monthlyBillMenuPageController =
        Get.put(MonthlyBillMenuPageController());
    return Scaffold(
      appBar: MyAppBar(
        title: 'Monthly Bills',
        hasbackButton: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => const GenerateBills(),
                          );
                        },
                        child: SizedBox(
                          width: 280.h,
                          height: 293.h,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppImages.calender,
                                  height: 100,
                                  width: 100,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Generate Bills\n(Manual)",
                                  style: GoogleFonts.montserrat(
                                      color: HexColor('#262626'),
                                      fontSize: 24.sp,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => const BillDetailsMainPage(),
                          );
                        },
                        child: SizedBox(
                          width: 280.h,
                          height: 293.h,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppImages.homePageBillVector,
                                  height: 100,
                                  width: 100,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Bills Details",
                                  style: GoogleFonts.montserrat(
                                      color: HexColor('#262626'),
                                      fontSize: 24.sp,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 280.h,
                        height: 293.h,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImages.homepageVector,
                                height: 100,
                                width: 100,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Update Charges",
                                style: GoogleFonts.montserrat(
                                    color: HexColor('#262626'),
                                    fontSize: 24.sp,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => const MonthlyBillsDateSetting(),
                          );
                        },
                        child: SizedBox(
                          width: 280.h,
                          height: 293.h,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppImages.monthlyBill,
                                  height: 100,
                                  width: 100,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Generate Bills\n(Auto)",
                                  style: GoogleFonts.montserrat(
                                      color: HexColor('#262626'),
                                      fontSize: 24.sp,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Image.asset(
                'assets/home_page_vector.png',
                width: 500.w,
                height: 500.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
