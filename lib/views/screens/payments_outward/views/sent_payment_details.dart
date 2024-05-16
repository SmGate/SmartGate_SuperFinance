import 'package:flutter/material.dart';
import 'package:super_finance/views/screens/payments_outward/component/sent_payment_details_data.dart';

import '../../../../widgets/my_appbar.dart';
import '../../smartgate_payments/components/table_header.dart';

class SentPaymentDetails extends StatelessWidget {
  const SentPaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Sent Payment Details",
        hasbackButton: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
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
                padding: const EdgeInsets.only(left: 20, right: 20),
                itemCount: 20,
                shrinkWrap: false,
                itemBuilder: (context, index) {
                  return SentPaymentsDetailsData(
                    index: index,
                  );
                }),
          )
        ],
      ),
    );
  }
}
