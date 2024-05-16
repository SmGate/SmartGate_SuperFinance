import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:super_finance/widgets/custom_button.dart';
import '../../../../utils/styles/colors.dart';
import '../../../../utils/validators.dart';
import '../../../../widgets/my_appbar.dart';
import '../../../../widgets/text_from_field.dart';
import '../../House Bills/View/generate_house_bill.dart';
import '../Controller/generate_society_apartment_bills_controller.dart';

class GenerateSocietyApartmentBills extends GetView {
  final _formKey = GlobalKey<FormState>();

  GenerateSocietyApartmentBills({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GenerateSocietyApartmentBillsController>(
        init: GenerateSocietyApartmentBillsController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              appBar: MyAppBar(
                title: 'Apartment Bills',
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
                            'assets/apartments.svg',
                            width: 200.w,
                            height: 200.w,
                            alignment: Alignment.center,
                          ),
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 30,
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
                                  readOnly: true,
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
                                  onPressed: () async {},
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ),
            ),
          );
        });
  }
}
