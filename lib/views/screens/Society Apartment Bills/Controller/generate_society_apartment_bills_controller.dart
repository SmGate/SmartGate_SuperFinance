import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/date_formatter.dart';

class GenerateSocietyApartmentBillsController extends GetxController {
  TextEditingController billStartDate = TextEditingController();
  TextEditingController billEndDate = TextEditingController();
  TextEditingController billDueDate = TextEditingController();

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

  // generateSocietyApartmentBillApi({
  //   required subAdminId,
  //   required financeManagerId,
  //   required dueDate,
  //   required billStartDate,
  //   required billEndDate,
  //   required bearerToken,
  // }) {
  //   loading = true;
  //   update();
  //   Map<String, String> data = <String, String>{
  //     'subadminid': subAdminId.toString(),
  //     'financemanagerid': financeManagerId.toString(),
  //     'duedate': dueDate.toString(),
  //     'billstartdate': billStartDate.toString(),
  //     'billenddate': billEndDate.toString(),
  //     'status': "unpaid"
  //   };
  //   billRepo
  //       .generateSocietyApartmentBillApi(bearerToken: bearerToken, data: data)
  //       .then((value) {
  //     loading = false;
  //     update();

  //     if (kDebugMode) {
  //       print(value);
  //       Get.snackbar('Message', value, backgroundColor: Colors.white);
  //       setResponseStatus(Status.completed);
  //     }
  //   }).onError((error, stackTrace) {
  //     loading = false;
  //     update();
  //     setResponseStatus(Status.error);
  //     Get.snackbar('Error', '$error ', backgroundColor: Colors.white);
  //     log(error.toString());
  //     log(stackTrace.toString());
  //   });
  // }
}
