import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllPaymentsController extends GetxController {
  Rx<DateTime> selectedStartDate = DateTime.now().obs;
  RxString selectedDate = "Select Date".obs;
  //////  FILTER FOR PAYMENT METHOD
  var selectedPaymentMethod = 'Select Payment Method'.obs;

  final List<String> paymentMethod = [
    'Select Payment Method',
    'Cash',
    'Bank Transfer',
  ];

  void setSelectedMethod(String m) {
    selectedPaymentMethod.value = m;
  }

  //////  FILTER FOR SOCIETY
  var selectedSociety = 'Select Society'.obs;

  final List<String> societise = [
    'Select Society',
    'DHA',
    'Royal Green',
  ];

  void setSelectedSociety(String s) {
    selectedSociety.value = s;
  }

  //////  For Date
  ///
  void selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedStartDate.value,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != selectedStartDate.value) {
      selectedStartDate.value = picked!;
      selectedDate.value = "${picked.toLocal()}".split(' ')[0];
    }
  }
}
