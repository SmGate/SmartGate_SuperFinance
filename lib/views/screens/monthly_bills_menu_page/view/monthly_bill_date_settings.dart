import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:super_finance/utils/images.dart';
import 'package:super_finance/utils/styles/colors.dart';
import 'package:super_finance/widgets/custom_button.dart';

import '../../../../utils/validators.dart';
import '../../../../widgets/my_appbar.dart';
import '../../../../widgets/text_from_field.dart';
import '../../accounting_dashboard/component/bill_detail_heading.dart';
import '../controller/monthly_bill_date_settings_controller.dart';

class MonthlyBillsDateSetting extends StatelessWidget {
  const MonthlyBillsDateSetting({super.key});

  @override
  Widget build(BuildContext context) {
    var monthlyBillsDateSettingController =
        Get.put(MonthlyBillDateSettingsController());
    return Scaffold(
        appBar: MyAppBar(
          title: 'Auto Generate Bill',
          hasbackButton: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 20),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: DropdownButton<String>(
                        value: monthlyBillsDateSettingController
                            .selectedItem.value,
                        onChanged: (newValue) {
                          monthlyBillsDateSettingController.selectedItem.value =
                              newValue ?? "";
                        },
                        items: <String>[
                          'Normal Bill',
                          'Consolidated Bill',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Center(
                    child: SvgPicture.asset(
                      AppImages.house,
                      width: 200.w,
                      height: 200.w,
                      alignment: Alignment.center,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
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
                          controller: monthlyBillsDateSettingController
                              .billStartDateController,
                          readOnly: true,
                          suffixIcon: const Icon(Icons.date_range),
                          fillColor: Colors.white,
                          validator: emptyStringValidator,
                          hintText: 'Choose Bill Start Date',
                          labelText: 'Choose Bill Start Date',
                          onTap: () {
                            monthlyBillsDateSettingController
                                .selectStartDate(context);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const BillDateHeading(title: 'Expiry Date'),
                        const SizedBox(
                          height: 20,
                        ),
                        MyTextFormField(
                          controller: monthlyBillsDateSettingController
                              .billEndDateController,
                          readOnly: true,
                          suffixIcon: const Icon(Icons.date_range),
                          fillColor: Colors.white,
                          validator: emptyStringValidator,
                          hintText: 'Choose Bill Expiry Date',
                          labelText: 'Choose Bill Expiry Date',
                          onTap: () {
                            monthlyBillsDateSettingController.selectEndDate(
                                context,
                                monthlyBillsDateSettingController
                                    .selectedStartDate.value);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const BillDateHeading(title: 'Due Date'),
                        const SizedBox(
                          height: 20,
                        ),
                        MyTextFormField(
                          controller: monthlyBillsDateSettingController
                              .billDueDateController,
                          //  readOnly: true,
                          suffixIcon: const Icon(Icons.date_range),
                          fillColor: Colors.white,
                          validator: emptyStringValidator,
                          hintText: 'Choose Bill Due Date',
                          labelText: 'Choose Bill Due Date',

                          onTap: () {
                            monthlyBillsDateSettingController.selectDueDate(
                                context,
                                monthlyBillsDateSettingController
                                    .selectedStartDate.value,
                                monthlyBillsDateSettingController
                                    .selectedEndtDate.value);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        monthlyBillsDateSettingController.selectedItem.value ==
                                "Normal Bill"
                            ? const SizedBox()
                            : const BillDateHeading(title: 'From Month'),
                        monthlyBillsDateSettingController.selectedItem.value ==
                                "Normal Bill"
                            ? const SizedBox()
                            : Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                child: SizedBox(
                                  width: 550,
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    hint: const Text('Select Month'),
                                    value: monthlyBillsDateSettingController
                                        .fromMonth.value,
                                    onChanged: (newValue) {
                                      monthlyBillsDateSettingController
                                          .fromMonth.value = newValue ?? "";
                                    },
                                    items: monthlyBillsDateSettingController
                                        .months
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                        const SizedBox(
                          height: 20,
                        ),
                        monthlyBillsDateSettingController.selectedItem.value ==
                                "Normal Bill"
                            ? const SizedBox()
                            : const BillDateHeading(title: 'To Month'),
                        monthlyBillsDateSettingController.selectedItem.value ==
                                "Normal Bill"
                            ? const SizedBox()
                            : Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                child: SizedBox(
                                  width: 550,
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    hint: const Text('Select Month'),
                                    value: monthlyBillsDateSettingController
                                        .toMonth.value,
                                    onChanged: (newValue) {
                                      monthlyBillsDateSettingController
                                          .toMonth.value = newValue ?? "";
                                    },
                                    items: monthlyBillsDateSettingController
                                        .months
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                        const SizedBox(
                          height: 50,
                        ),
                        myElevatedButton(
                          height: 60,
                          width: 600,
                          backgroundColor: primaryColor,
                          textColor: whiteColor,
                          text: 'Save',
                          onPressed: () async {},
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
