// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:super_finance/views/screens/smartgate_payments/components/table_header.dart';

class SentPaymentsDetailsData extends StatelessWidget {
  int? index;
  SentPaymentsDetailsData({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: index! % 2 == 0 ? Colors.white : Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          children: [
            TableRow(children: [
              TableHeader(
                text: "Ahmad ALi",
              ),
              TableHeader(
                text: "03129054321",
              ),
              TableHeader(
                text: "Aprile",
              ),
              TableHeader(
                text: "4000",
              ),
              TableHeader(
                text: "1200",
              ),
              TableHeader(
                text: "House",
              ),
              TableHeader(
                text: "Paid",
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {},
                      child: const Text(
                        "Details",
                        style: TextStyle(color: Colors.white),
                      )))
            ])
          ],
        ),
      ),
    );
  }
}
