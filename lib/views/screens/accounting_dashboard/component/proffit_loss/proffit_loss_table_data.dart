import 'package:flutter/material.dart';

import '../../../smartgate_payments/components/table_header.dart';

class ProffitLossTableData extends StatelessWidget {
  const ProffitLossTableData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          children: [
            TableRow(children: [
              TableHeader(
                text: "1/23/2024",
              ),
              TableHeader(
                text: "1/23/2024",
              ),
              TableHeader(
                text: "xyz",
              ),
              TableHeader(
                text: "paid",
              ),
              TableHeader(
                text: "123,0000",
              ),
              TableHeader(
                text: "133,0000",
              ),
            ])
          ],
        ),
      ),
    );
  }
}
