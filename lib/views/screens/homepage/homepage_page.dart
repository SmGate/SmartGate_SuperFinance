// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/images.dart';
import '../../../widgets/menu_widget.dart';
import '../../../widgets/my_appbar.dart';
import '../accounting_dashboard/views/accounting_dashboard.dart';
import '../smartgate_payments/payments_dashboard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Home",
        hasbackButton: false,
      ),
      body: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 50),
                child: Row(
                  children: [
                    menuWidget(
                        AppImages.societryFinanceDate, "Society Finace", () {}),
                    const SizedBox(
                      width: 40,
                    ),
                    menuWidget(AppImages.payments, "SmartGate Payments", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PaymentsDashboard()),
                      );
                    }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 50),
                child: Row(
                  children: [
                    menuWidget(AppImages.accounting, " Accounting Dashboard",
                        () {
                      Get.to(() => AccountingDashboard());
                      // MaterialPageRoute(
                      //     builder: (context) => AccountingDashboard());
                    }),
                    const SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            width: 40,
          ),
          Image.asset(
            AppImages.homepageVector,
          )
        ],
      ),
    );
  }
}
