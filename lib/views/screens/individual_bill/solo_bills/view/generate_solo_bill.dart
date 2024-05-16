// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../utils/styles/colors.dart';
import '../../../../../utils/validators.dart';
import '../../../../../widgets/custom_button.dart';
import '../../../../../widgets/my_appbar.dart';
import '../../../../../widgets/text_from_field.dart';
import '../controller/individual_bill_controller.dart';

class GenerateSoloBill extends StatefulWidget {
  int? id;
  String? payableamount;
  String? chagres;
  String? lateCharges;
  String? tax;
  String? appcharges;
  String? balance;
  String? duedate;
  String? billstartdate;
  String? billenddate;
  String? paymentType;
  String? totalPaidAmount;
  String? specificType;

  GenerateSoloBill(
      {super.key,
      this.id,
      this.chagres,
      this.payableamount,
      this.balance,
      this.appcharges,
      this.lateCharges,
      this.tax,
      this.duedate,
      this.billstartdate,
      this.billenddate,
      this.paymentType,
      this.totalPaidAmount,
      this.specificType});

  @override
  State<GenerateSoloBill> createState() => _GenerateSoloBillState();
}

class _GenerateSoloBillState extends State<GenerateSoloBill> {
  var individualBillController = Get.put(IndividualBillCOntroller());
  final _formKey = GlobalKey<FormState>();
  String? selectedItem = "Select Type";

  @override
  void initState() {
    individualBillController.chargesController.text =
        widget.payableamount ?? "";

    individualBillController.lateChargesController.text =
        widget.lateCharges ?? "";
    individualBillController.taxAmountController.text = widget.tax ?? "";
    individualBillController.dueDateController.text = widget.duedate ?? "";
    individualBillController.billStartDateController.text =
        widget.billstartdate ?? "";
    individualBillController.billEndDateController.text =
        widget.billenddate ?? "";

    individualBillController.descriptionController.text =
        widget.billstartdate ?? "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Generate Solo Bill',
        hasbackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
          child: Form(
            key: _formKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Description",
                          style: GoogleFonts.montserrat(
                              color: secondaryColor,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 20.sp)),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: Card(
                            surfaceTintColor: Colors.white,
                            color: Colors.white,
                            elevation: 10,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                value: selectedItem,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedItem = newValue;
                                  });
                                },
                                items: <String>[
                                  'Select Type',
                                  'Electricity',
                                  'Water',
                                  'Gas',
                                  'Other',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            )),
                      ),
                      selectedItem == "Other"
                          ? const SizedBox(
                              height: 20,
                            )
                          : const SizedBox(),
                      selectedItem == "Other"
                          ? makeUpdateBillUi(
                              con: individualBillController
                                  .descriptionController,
                              hedingText: "Add Other Option",
                              validator: emptyStringValidator,
                              hint: "add other option")
                          : const SizedBox(),
                      const SizedBox(
                        height: 20,
                      ),
                      makeUpdateBillUi(
                          con: individualBillController.chargesController,
                          hedingText: "Charges",
                          validator: emptyStringValidator,
                          hint: " Charges"),
                      const SizedBox(
                        height: 20,
                      ),
                      makeUpdateBillUi(
                          con: individualBillController.lateChargesController,
                          hedingText: "Late Charges",
                          validator: emptyStringValidator,
                          hint: "Late Charges"),
                      const SizedBox(
                        height: 20,
                      ),
                      makeUpdateBillUi(
                          con: individualBillController.taxAmountController,
                          hedingText: "Tax",
                          validator: emptyStringValidator,
                          hint: "Tax"),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      makeUpdateBillUi(
                          con: individualBillController.dueDateController,
                          hedingText: "Due Date",
                          validator: emptyStringValidator,
                          hint: "Due Date"),
                      const SizedBox(
                        height: 20,
                      ),
                      makeUpdateBillUi(
                          con: individualBillController.billStartDateController,
                          hedingText: "Bill Start Date",
                          validator: emptyStringValidator,
                          hint: "Bill Start Date"),
                      const SizedBox(
                        height: 20,
                      ),
                      makeUpdateBillUi(
                          con: individualBillController.billEndDateController,
                          hedingText: "Bill End Date",
                          validator: emptyStringValidator,
                          hint: "Bill End Date"),
                      const SizedBox(
                        height: 20,
                      ),
                      myElevatedButton(
                        width: double.infinity,
                        height: 60,
                        text: 'SAVE',
                        backgroundColor: primaryColor,
                        textColor: whiteColor,
                        onPressed: () async {
                          if (_formKey.currentState != null &&
                              _formKey.currentState!.validate()) {}
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget makeUpdateBillUi(
    {TextEditingController? con,
    String? hedingText,
    String? hint,
    final String? Function(String?)? validator}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(hedingText ?? "",
          style: GoogleFonts.montserrat(
              color: secondaryColor,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: 20.sp)),
      const SizedBox(
        height: 10,
      ),
      MyTextFormField(
        controller: con!,
        hintText: hint ?? "",
        labelText: "",
        validator: validator,
      )
    ],
  );
}
