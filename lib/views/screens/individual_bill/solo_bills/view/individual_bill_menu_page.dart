import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:super_finance/utils/images.dart';
import 'package:super_finance/views/screens/individual_bill/solo_bills/view/all_residents.dart';
import '../../../../../widgets/my_appbar.dart';
import 'individual_bill_details.dart';

class IndividualBillMenuPage extends StatelessWidget {
  const IndividualBillMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Individual Bill',
        hasbackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const AllResidents());
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
                            AppImages.individualBill,
                            height: 100,
                            width: 100,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Generate Bills",
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
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const IndividualBillDetails());
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
            const Spacer(),
            Image.asset(
              'assets/home_page_vector.png',
              width: 900.w,
              height: 900.w,
            ),
          ],
        ),
      ),
    );
  }
}
