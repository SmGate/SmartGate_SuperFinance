// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../utils/styles/colors.dart';
import '../../../../../utils/validators.dart';
import '../../../../../widgets/custom_button.dart';
import '../../../../../widgets/my_appbar.dart';
import '../../../../../widgets/text_from_field.dart';
import '../../controller/add_expanse_controller.dart';

class AddExpanse extends StatelessWidget {
  const AddExpanse({super.key});

  @override
  Widget build(BuildContext context) {
    AddExpenseController addExpanseController = Get.put(AddExpenseController());
    return Scaffold(
      appBar: MyAppBar(
        title: 'Add Expense',
        hasbackButton: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 40, right: 40, top: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Amount",
                            style: GoogleFonts.montserrat(
                                color: secondaryColor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 20.sp)),
                        MyTextFormField(
                          controller: addExpanseController.amountController,
                          hintText: "",
                          labelText: "",
                          validator: emptyStringValidator,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("Expanse Details",
                            style: GoogleFonts.montserrat(
                                color: secondaryColor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 20.sp)),
                        MyTextFormField(
                          controller:
                              addExpanseController.expanseDetailsController,
                          hintText: "",
                          labelText: "",
                          validator: emptyStringValidator,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("Expanse Type",
                            style: GoogleFonts.montserrat(
                                color: secondaryColor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 20.sp)),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 500,
                          child: Card(
                              surfaceTintColor: Colors.white,
                              color: Colors.white,
                              elevation: 10,
                              child: DropdownButtonHideUnderline(
                                child: Obx(() => DropdownButton<String>(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      value: addExpanseController
                                          .selectedItem?.value,
                                      onChanged: (String? newValue) {
                                        addExpanseController.selectedItem
                                            ?.value = newValue ?? "";
                                      },
                                      items: <String>[
                                        'Select Type',
                                        'Electricity',
                                        'Event',
                                        'Salaries',
                                        'Maintenance',
                                        'Other',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    )),
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("Payment Method",
                            style: GoogleFonts.montserrat(
                                color: secondaryColor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 20.sp)),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 500,
                          child: Card(
                              surfaceTintColor: Colors.white,
                              color: Colors.white,
                              elevation: 10,
                              child: DropdownButtonHideUnderline(
                                child: Obx(() => DropdownButton<String>(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      value: addExpanseController
                                          .selectPaymentMethod?.value,
                                      onChanged: (String? newValue) {
                                        addExpanseController.selectPaymentMethod
                                            ?.value = newValue ?? "";
                                      },
                                      items: <String>[
                                        'Select Payment Method',
                                        'Cash',
                                        'Bank Transfer',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    )),
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("Date",
                            style: GoogleFonts.montserrat(
                                color: secondaryColor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 20.sp)),
                        MyTextFormField(
                          controller:
                              addExpanseController.billStartDateController,
                          readOnly: true,
                          suffixIcon: const Icon(Icons.date_range),
                          fillColor: Colors.white,
                          validator: emptyStringValidator,
                          hintText: 'Select Date',
                          labelText: 'Select Date',
                          onTap: () {
                            addExpanseController.selectStartDate(context);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("Upload Receipt",
                            style: GoogleFonts.montserrat(
                                color: secondaryColor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 20.sp)),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 600,
                          child: Row(
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange),
                                  onPressed: () {},
                                  child: const Text(
                                    "From Documents",
                                    style: TextStyle(color: Colors.white),
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                width: 150,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange),
                                    onPressed: () {},
                                    child: const Text(
                                      "Scan",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              myElevatedButton(
                  text: "Save", onPressed: () {}, height: 60, width: 300)
            ],
          ),
        ),
      ),
    );
  }
}
