import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/my_appbar.dart';
import 'components/payments_data.dart';
import 'components/table_header.dart';
import 'controller/all_payment_controller.dart';

class Payments extends StatelessWidget {
  const Payments({super.key});

  @override
  Widget build(BuildContext context) {
    var allPaymentController = Get.put(AllPaymentsController());
    return Scaffold(
        appBar: MyAppBar(
          title: "Payments",
          hasbackButton: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Obx(
            () => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        allPaymentController.selectStartDate(context);
                      },
                      child: SizedBox(
                        height: 60,
                        child: Card(
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              allPaymentController.selectedDate.value,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700),
                            ),
                          )),
                        ),
                      ),
                    ),
                    Card(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          value:
                              allPaymentController.selectedPaymentMethod.value,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              allPaymentController
                                  .selectedPaymentMethod(newValue);
                            }
                          },
                          items: allPaymentController.paymentMethod
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Card(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          value: allPaymentController.selectedSociety.value,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              allPaymentController.setSelectedSociety(newValue);
                            }
                          },
                          items: allPaymentController.societise
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.grey[100],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Table(
                      children: [
                        TableRow(children: [
                          TableHeader(
                            text: "NAME",
                          ),
                          TableHeader(
                            text: "MOBILE",
                          ),
                          TableHeader(
                            text: "MONTH",
                          ),
                          TableHeader(
                            text: "AMOUNT",
                          ),
                          TableHeader(
                            text: "BALANCE",
                          ),
                          TableHeader(
                            text: "TYPE",
                          ),
                          TableHeader(
                            text: "STATUS",
                          ),
                          TableHeader(
                            text: "DETAILS",
                          ),
                        ])
                      ],
                    ),
                  ),
                ),
                Expanded(
                  //      height: 600,
                  child: ListView.builder(
                      itemCount: 20,
                      shrinkWrap: false,
                      itemBuilder: (context, index) {
                        return PaymentsData(
                          index: index,
                        );
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
