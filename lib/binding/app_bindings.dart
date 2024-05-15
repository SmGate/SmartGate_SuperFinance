// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:super_finance/views/screens/smartgate_payments/controller/all_payment_controller.dart';
import '../views/screens/payments_outward/controller/payment_outward_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllPaymentsController>(() => AllPaymentsController());
    Get.lazyPut<PaymentoutwardController>(() => PaymentoutwardController());
  }
}
