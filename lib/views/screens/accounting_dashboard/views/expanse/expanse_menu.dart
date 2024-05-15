import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:super_finance/views/screens/accounting_dashboard/views/expanse/add_expanse.dart';
import 'package:super_finance/views/screens/accounting_dashboard/views/expanse/expanse_details.dart';
import '../../../../../utils/validators.dart';
import '../../../../../widgets/my_appbar.dart';
import '../../../../../widgets/text_from_field.dart';
import '../../component/bill_detail_heading.dart';
import '../../controller/expanse_details_controller.dart';

class ExpanseMenu extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  ExpanseMenu({super.key});

  @override
  Widget build(BuildContext context) {
    var expanseDetailsController = Get.put(ExpanseDetailsController());

    return Scaffold(
      appBar: MyAppBar(
        title: 'Expanse',
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
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const AddExpanse());
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
                            "Add Expanse",
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
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    _showDialogue(context, expanseDetailsController, formKey);
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
                            "Expanse Details",
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
      ExpanseDetailsController expanseDetailsController,
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
                        expanseDetailsController.billStartDateController,
                    readOnly: true,
                    suffixIcon: const Icon(Icons.date_range),
                    fillColor: Colors.white,
                    validator: emptyStringValidator,
                    hintText: 'Choose  Start Date',
                    labelText: 'Choose  Start Date',
                    onTap: () {
                      expanseDetailsController.selectStartDate(context);
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
                    controller: expanseDetailsController.billEndDateController,
                    readOnly: true,
                    suffixIcon: const Icon(Icons.date_range),
                    fillColor: Colors.white,
                    validator: emptyStringValidator,
                    hintText: 'Choose  End Date',
                    labelText: 'Choose  End Date',
                    onTap: () {
                      expanseDetailsController.selectEndDate(context,
                          expanseDetailsController.selectedStartDate.value);
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
                      Get.to(() => const ExpanseDetails());
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
