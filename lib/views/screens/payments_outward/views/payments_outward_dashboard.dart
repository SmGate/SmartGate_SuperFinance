import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_finance/views/screens/payments_outward/controller/payment_outward_controller.dart';
import 'package:super_finance/views/screens/payments_outward/views/sent_payment_details.dart';
import 'package:super_finance/widgets/my_appbar.dart';

import '../../../../utils/images.dart';
import '../../../../utils/styles/colors.dart';
import '../../../../utils/styles/text_styles.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/menu_widget.dart';

class PaymentsOutwardDashboard extends StatelessWidget {
  const PaymentsOutwardDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    var paymentoutwardController = Get.put(PaymentoutwardController());
    return Scaffold(
      appBar: MyAppBar(
        title: "Payments Outward ",
        hasbackButton: true,
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
          child: Obx(
            () => Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Column(
                children: [
                  menuWidget(AppImages.sendPayments, "Send Payments\n(Society)",
                      () {
                    paymentoutwardController.isSendPaymentSelected.value =
                        !paymentoutwardController.isSendPaymentSelected.value;
                  }),
                  const SizedBox(
                    height: 40,
                  ),
                  menuWidget(AppImages.paymentDetails, "Sent Payments Details",
                      () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SentPaymentDetails()));
                  }),
                ],
              ),
              const Spacer(),
              paymentoutwardController.isSendPaymentSelected.value
                  ? SizedBox(
                      height: 250,
                      width: 300,
                      child: Card(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                "Royal Green",
                                style: AppTextStyles.midHeading,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                children: [
                                  Text(
                                    "Total Payments",
                                    style: AppTextStyles.midHeading
                                        .copyWith(fontSize: 14),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "800000",
                                    style: AppTextStyles.midHeading
                                        .copyWith(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                children: [
                                  Text(
                                    "Payable Amount",
                                    style: AppTextStyles.midHeading
                                        .copyWith(fontSize: 14),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "340000",
                                    style: AppTextStyles.midHeading
                                        .copyWith(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            myElevatedButton(
                                text: "Send",
                                onPressed: () {},
                                backgroundColor: primaryColor,
                                textColor: whiteColor,
                                height: 40,
                                width: 200)
                          ],
                        ),
                      ),
                    )
                  : const SizedBox()
            ]),
          )),
    );
  }
}
