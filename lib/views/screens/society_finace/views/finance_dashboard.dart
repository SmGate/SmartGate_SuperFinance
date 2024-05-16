import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:super_finance/utils/images.dart';

import '../../../../widgets/my_appbar.dart';
import '../../individual_bill/solo_bills/view/individual_bill_menu_page.dart';
import '../../monthly_bills_menu_page/view/monthly_bill_menu_page.dart';

class FinanceDashboard extends StatelessWidget {
  const FinanceDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          title: "Finance Dashboard",
          hasbackButton: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Row(
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // appStoreController
                      //     ?.assignUser(controller.user);
                      Get.to(
                        () => const MonthlyBillMenuPage(),
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
                              "Monthly Bills",
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
                    width: 200,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const IndividualBillMenuPage());
                    },
                    child: SizedBox(
                      width: 280.h,
                      height: 293.h,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.individualBill,
                              height: 100,
                              width: 100,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Individual Bill",
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
              const Spacer(),
              Image.asset(
                AppImages.homepageVector,
              ),
            ],
          ),
        ));
  }
}
