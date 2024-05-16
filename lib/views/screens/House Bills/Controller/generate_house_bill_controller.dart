import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/date_formatter.dart';

class GenerateHouseBillController extends GetxController {
  RxBool loading = false.obs;

  TextEditingController billStartDate = TextEditingController();
  TextEditingController billEndDate = TextEditingController();
  TextEditingController billDueDate = TextEditingController();

  RxString error = "".obs;

  @override
  void onInit() {
    super.onInit();
    DateTime lastDayOfMonth =
        DateTime(DateTime.now().year, DateTime.now().month + 1, 0);
    DateTime fifthDayOfMonth =
        DateTime(DateTime.now().year, DateTime.now().month, 5);
    DateTime dueDate = DateTime.now()
        .add(Duration(days: lastDayOfMonth.day - DateTime.now().day + 16));
    billStartDate.text = DateFormatter().formatDate1(date: fifthDayOfMonth);
    billEndDate.text = DateFormatter().formatDate1(date: lastDayOfMonth);
    billDueDate.text = DateFormatter().formatDate1(date: dueDate);
  }

  // void genrateHouseBill({
  //   String? subAdminId,
  //   String? financeManagerId,
  //   String? dueDate,
  //   String? billStartDate,
  //   String? billEndDate,
  // }) async {
  //   loading.value = true;
  //   error.value = "";

  //   var res = await GenerateHouseBillService.generateHouseBill(
  //       subAdminId: subAdminId,
  //       financeManagerId: financeManagerId,
  //       dueDate: dueDate,
  //       billEndDate: billEndDate,
  //       billStartDate: billStartDate);

  //   loading.value = false;

  //   if (res is GenerateHouseBill) {
  //     generateHouseBillModel = GenerateHouseBill();
  //     Get.snackbar('Message', res.message.toString(),
  //         backgroundColor: Colors.white);
  //   } else {
  //     error.value = res.toString();
  //     loading.value = false;
  //     Get.snackbar('Message', error.value, backgroundColor: Colors.white);
  //   }
  // }
}
