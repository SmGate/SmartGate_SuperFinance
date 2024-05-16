import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndividualBillCOntroller extends GetxController {
  TextEditingController chargesController = TextEditingController();
  TextEditingController lateChargesController = TextEditingController();
  TextEditingController taxAmountController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  TextEditingController billStartDateController = TextEditingController();
  TextEditingController billEndDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  RxBool loading = false.obs;
  RxString error = "".obs;

  ///// DATES
  Rx<DateTime> selectedStartDate = DateTime.now().obs;
  Rx<DateTime> selectedEndtDate = DateTime.now().obs;
  Rx<DateTime> selectedDuetDate = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();

    //  start date
    Rx<DateTime> selectedStartDate = DateTime.now().obs;
    billStartDateController.text =
        "${selectedStartDate.value.year}-${selectedStartDate.value.month}-${selectedStartDate.value.day}";
    // Calculate end date based on start date
    DateTime start = selectedStartDate.value;
    DateTime end = DateTime(start.year, start.month + 1, start.day);
    selectedEndtDate.value = end;
    billEndDateController.text = "${end.year}-${end.month}-${end.day}";

    // Calculate due date as the 16th of the current month
    DateTime now = DateTime.now();
    DateTime dueDate = DateTime(now.year, now.month, 16);
    selectedDuetDate.value = dueDate;

    dueDateController.text = "${dueDate.year}-${dueDate.month}-${dueDate.day}";
  }

  // void generateSoloBill(
  //     {String? charges,
  //     String? latecharges,
  //     String? tax,
  //     int? subadminid,
  //     int? financeManagerid,
  //     int? residentid,
  //     int? propertyid,
  //     int? measurementid,
  //     String? duedate,
  //     String? status,
  //     String? billstartdate,
  //     String? billenddate,
  //     String? specifictype,
  //     String? description}) async {
  //   loading.value = true;
  //   error.value = "";

  //   var res = await billRepo.generateSoloBill(
  //       charges: charges,
  //       latecharges: latecharges,
  //       tax: tax,
  //       subadminid: subadminid,
  //       financeManagerid: financeManagerid,
  //       residentid: residentid,
  //       propertyid: propertyid,
  //       measurementid: measurementid,
  //       duedate: duedate,
  //       status: status,
  //       billenddate: billenddate,
  //       billstartdate: billstartdate,
  //       specifictype: specifictype,
  //       description: description);

  //   loading.value = false;
  //   if (res is GenerateSoloBill) {
  //     geberateSoloBillModel = res;

  //     loading.value = false;

  //     Get.snackbar('Message', res.message.toString(),
  //         backgroundColor: Colors.white);
  //   } else {
  //     loading.value = false;
  //     error.value = res.toString();

  //     Get.snackbar('Message', error.value, backgroundColor: Colors.white);
  //   }
  // }

  /////////////////////////////////

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

  ///////  FOR DUE DATE
  void selectDueDate(BuildContext context, DateTime? selectedStartDate,
      DateTime? selectedEndDate) async {
    if (selectedStartDate == null) {
      Get.snackbar('Error', 'Please select the start date first.',
          backgroundColor: Colors.white);

      return;
    }

    if (selectedEndDate == null) {
      Get.snackbar('Error', 'Please select the end date first',
          backgroundColor: Colors.white);

      return;
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedEndDate.subtract(const Duration(days: 1)),
      firstDate: selectedStartDate.add(const Duration(days: 1)),
      lastDate: selectedEndDate.subtract(const Duration(days: 1)),
    );

    if (picked != null &&
        picked.isAfter(selectedStartDate) &&
        picked.isBefore(selectedEndDate)) {
      // Due date is valid
      selectedDuetDate.value = picked;
      dueDateController.text = "${picked.toLocal()}".split(' ')[0];
    } else if (picked != null &&
        (picked.isBefore(selectedStartDate) ||
            picked.isAfter(selectedEndDate))) {
      Get.snackbar(
          'Error', 'Due date should be between the start date and end date',
          backgroundColor: Colors.white);
    }
  }
}
