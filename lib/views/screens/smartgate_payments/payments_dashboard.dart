import 'package:flutter/material.dart';
import 'package:super_finance/views/screens/smartgate_payments/all_payments.dart';

import '../../../utils/images.dart';
import '../../../widgets/menu_widget.dart';
import '../../../widgets/my_appbar.dart';
import '../payments_outward/views/payments_outward_dashboard.dart';

class PaymentsDashboard extends StatelessWidget {
  const PaymentsDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Payments Dashboard",
        hasbackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 40, top: 40),
        child: Row(children: [
          Column(
            children: [
              menuWidget(AppImages.paymentReceived, "Payments Received", () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Payments()));
              }),
              const SizedBox(
                height: 40,
              ),
              menuWidget(AppImages.paymentOutward, "Payments Outward", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const PaymentsOutwardDashboard()));
              }),
            ],
          ),
          const Spacer(),
          Image.asset(
            AppImages.homepageVector,
          )
        ]),
      ),
    );
  }
}
