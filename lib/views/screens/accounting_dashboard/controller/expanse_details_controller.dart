import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpanseDetailsController extends GetxController {
  Rx<DateTime> selectedStartDate = DateTime.now().obs;
  Rx<DateTime> selectedEndtDate = DateTime.now().obs;

  TextEditingController billStartDateController = TextEditingController();
  TextEditingController billEndDateController = TextEditingController();

  RxString? selectedItem = "Select Payment Method".obs;

  @override
  void onInit() {
    selectedStartDate = DateTime.now().obs;
    super.onInit();
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

  /////  FUNCTION FOR END DATE

  void selectEndDate(BuildContext context, DateTime? selectedStartDate) async {
    if (selectedStartDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select the start date first.'),
        ),
      );
      return;
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedStartDate.add(const Duration(days: 1)),
      firstDate: selectedStartDate.add(const Duration(days: 1)),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked.isAfter(selectedStartDate)) {
      billEndDateController.text = "${picked.toLocal()}".split(' ')[0];
      selectedEndtDate.value = picked;
    } else if (picked != null && picked.isBefore(selectedStartDate)) {
      Get.snackbar('Error', 'End date should be greater than the start date',
          backgroundColor: Colors.white);
    }
  }
}
