import 'package:flutter/material.dart';
import '../../../../../widgets/my_appbar.dart';
import '../../../smartgate_payments/components/table_header.dart';
import '../../component/individual_bill_data_table.dart';

class IndividualBillDetails extends StatelessWidget {
  const IndividualBillDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Individual Bill Detail',
        hasbackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
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
                    return IndividualBillData(
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
