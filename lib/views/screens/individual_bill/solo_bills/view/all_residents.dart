import 'package:flutter/material.dart';

import '../../../../../widgets/my_appbar.dart';
import '../../../smartgate_payments/components/table_header.dart';
import '../../component/resident_data_table.dart';

class AllResidents extends StatelessWidget {
  const AllResidents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Residents',
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
                        text: "USERNAME",
                      ),
                      TableHeader(
                        text: "COUNTRY",
                      ),
                      TableHeader(
                        text: "STATE",
                      ),
                      TableHeader(
                        text: "ADDRESS",
                      ),
                      TableHeader(
                        text: "RESIDENT TYPE",
                      ),
                      TableHeader(
                        text: "ACTION",
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
                    return ResidentDataTable(
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
