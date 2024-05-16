// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_finance/utils/styles/colors.dart';
import 'package:super_finance/widgets/custom_button.dart';
import '../../../../utils/validators.dart';
import '../../../../widgets/my_appbar.dart';
import '../../../../widgets/text_from_field.dart';
import '../Controller/generate_house_bill_controller.dart';

class GenerateHouseBill extends GetView {
  final _formKey = GlobalKey<FormState>();

  GenerateHouseBill({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GenerateHouseBillController>(
        init: GenerateHouseBillController(),
        builder: (controller) {
          return SafeArea(
            child: WillPopScope(
              onWillPop: () async {
                return true;
              },
              child: Scaffold(
                appBar: MyAppBar(
                  title: 'House Bills',
                  hasbackButton: true,
                ),
                body: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          SvgPicture.asset(
                            'assets/houses.svg',
                            width: 200.w,
                            height: 200.w,
                            alignment: Alignment.center,
                          ),
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                const BillDateHeading(title: 'Start Date'),
                                const SizedBox(
                                  height: 20,
                                ),
                                MyTextFormField(
                                  controller: controller.billStartDate,
                                  readOnly: true,
                                  suffixIcon: const Icon(Icons.date_range),
                                  fillColor: Colors.white,
                                  validator: emptyStringValidator,
                                  hintText: 'Choose Bill Start Date',
                                  labelText: 'Choose Bill Start Date',
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const BillDateHeading(title: 'End Date'),
                                const SizedBox(
                                  height: 20,
                                ),
                                MyTextFormField(
                                  controller: controller.billEndDate,
                                  readOnly: true,
                                  suffixIcon: const Icon(Icons.date_range),
                                  fillColor: Colors.white,
                                  validator: emptyStringValidator,
                                  hintText: 'Choose Bill END Date',
                                  labelText: 'Choose Bill END Date',
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const BillDateHeading(title: 'Due Date'),
                                const SizedBox(
                                  height: 20,
                                ),
                                MyTextFormField(
                                  controller: controller.billDueDate,
                                  //  readOnly: true,
                                  suffixIcon: const Icon(Icons.date_range),
                                  fillColor: Colors.white,
                                  validator: emptyStringValidator,
                                  hintText: 'Choose Bill Due Date',
                                  labelText: 'Choose Bill Due Date',
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                myElevatedButton(
                                  text: 'Generate',
                                  backgroundColor: primaryColor,
                                  textColor: whiteColor,
                                  height: 60,
                                  width: 500,
                                  onPressed: () async {
                                    // controller.genrateHouseBill(
                                    //   subAdminId: appStoreController
                                    //       ?.user?.data?.subadminid
                                    //       .toString(),

                                    //   financeManagerId: appStoreController
                                    //       ?.user?.data?.id
                                    //       .toString(),
                                    //   dueDate: controller.billDueDate.text,
                                    //   billStartDate:
                                    //       controller.billStartDate.text,
                                    //   billEndDate:
                                    //       controller.billEndDate.text,

                                    // );
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

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
