import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../widgets/my_appbar.dart';
import '../../../smartgate_payments/components/table_header.dart';
import '../../component/expanse/expanse_details_data.dart';
import '../../controller/expanse_details_controller.dart';

class ExpanseDetails extends StatelessWidget {
  const ExpanseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var expanseDetailsController = Get.put(ExpanseDetailsController());
    return Scaffold(
      appBar: MyAppBar(
        title: 'Expanse Details',
        hasbackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.only(top: 40),
                color: Colors.white,
                width: 300,
                child: Card(
                    surfaceTintColor: Colors.white,
                    color: Colors.white,
                    elevation: 10,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        value: expanseDetailsController.selectedItem?.value,
                        onChanged: (String? newValue) {
                          expanseDetailsController.selectedItem?.value =
                              newValue ?? "";
                        },
                        items: <String>[
                          'Select Payment Method',
                          'Cash',
                          'Bank Transfer',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 40,
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
                        text: "BILLING MONTH",
                      ),
                      TableHeader(
                        text: "PAYABLE AMOUNT",
                      ),
                      TableHeader(
                        text: "BALANCE",
                      ),
                      TableHeader(
                        text: "TYPE",
                      ),
                      TableHeader(
                        text: "BILL GENERATION DATE",
                      ),
                      TableHeader(
                        text: "PAY BY",
                      ),
                      // TableHeader(
                      //   text: "DUE DATE",
                      // ),
                      // TableHeader(
                      //   text: "ADDRESS",
                      // ),
                      // TableHeader(
                      //   text: "PAYMENT TYPE",
                      // ),
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
              child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return ExpanseDetailsData(
                      index: index,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
