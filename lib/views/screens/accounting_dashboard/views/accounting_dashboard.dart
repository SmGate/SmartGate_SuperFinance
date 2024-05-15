import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:super_finance/views/screens/accounting_dashboard/views/reports/reports_dashboard.dart';

import '../../../../utils/validators.dart';
import '../../../../widgets/my_appbar.dart';

import '../../../../widgets/text_from_field.dart';
import '../component/bill_detail_heading.dart';
import '../controller/revenue_sales_controller.dart';
import 'expanse/expanse_menu.dart';
import 'revenue_sales/revenus_sales.dart';

class AccountingDashboard extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  AccountingDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    var revenuDetailsController = Get.put(RevenueSalesController());
    return Scaffold(
      appBar: MyAppBar(
        title: 'Accounting Dashboard',
        hasbackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => ExpanseMenu());
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
                                "assets/expense.png",
                                height: 100,
                                width: 100,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Expanse",
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
                      width: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        _showDialogue(
                            context, revenuDetailsController, formKey);
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
                                "assets/sales.png",
                                height: 100,
                                width: 100,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Revenu/Sales",
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
                  height: 40,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const ReportsDashboard());
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
                                "assets/report.png",
                                height: 100,
                                width: 100,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Reports",
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
                )
              ],
            ),
            const Spacer(),
            Image.asset(
              'assets/home_page_vector.png',
              width: 700.w,
              height: 700.w,
            ),
          ],
        ),
      ),
    );
  }

  void _showDialogue(
      BuildContext context,
      RevenueSalesController revenueDetailsController,
      GlobalKey<FormState> formKey) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const BillDateHeading(title: 'Choose Date'),
                  const SizedBox(
                    height: 20,
                  ),
                  const BillDateHeading(title: 'Start Date'),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextFormField(
                    controller:
                        revenueDetailsController.billStartDateController,
                    readOnly: true,
                    suffixIcon: const Icon(Icons.date_range),
                    fillColor: Colors.white,
                    validator: emptyStringValidator,
                    hintText: 'Choose Start Date',
                    labelText: 'Choose Start Date',
                    onTap: () {
                      revenueDetailsController.selectStartDate(context);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const BillDateHeading(title: 'End Date'),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextFormField(
                    controller: revenueDetailsController.billEndDateController,
                    readOnly: true,
                    suffixIcon: const Icon(Icons.date_range),
                    fillColor: Colors.white,
                    validator: emptyStringValidator,
                    hintText: 'Choose End Date',
                    labelText: 'Choose End Date',
                    onTap: () {
                      revenueDetailsController.selectEndDate(context,
                          revenueDetailsController.selectedStartDate.value);
                    },
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Get.to(() => const Revenue());
                    }
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          );
        });
  }
}
