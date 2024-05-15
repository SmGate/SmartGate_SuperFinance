import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddExpenseController extends GetxController {
  var amountController = TextEditingController();
  var expanseDetailsController = TextEditingController();

  RxString? selectedItem = "Select Type".obs;

  RxString? selectPaymentMethod = "Select Payment Method".obs;
  Rx<DateTime> selectedStartDate = DateTime.now().obs;
  TextEditingController billStartDateController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    Rx<DateTime> selectedStartDate = DateTime.now().obs;
    billStartDateController.text =
        "${selectedStartDate.value.year}-${selectedStartDate.value.month}-${selectedStartDate.value.day}";
  }

  void selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedStartDate.value,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != selectedStartDate.value) {
      selectedStartDate.value = picked!;
      billStartDateController.text = "${picked.toLocal()}".split(' ')[0];
    }
  }
}
