import 'package:flutter/material.dart';

import '../component/previouse_bill_data_table.dart';
import '../component/table_header.dart';

class PreviouseBill extends StatelessWidget {
  const PreviouseBill({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
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
          SizedBox(
            height: 600,
            child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return PreviousBillDataWidget(
                    index: index,
                  );
                }),
          )
        ],
      ),
    );
  }
}
