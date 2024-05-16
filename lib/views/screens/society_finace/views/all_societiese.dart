import 'package:flutter/material.dart';

import '../../../../widgets/my_appbar.dart';
import '../../smartgate_payments/components/table_header.dart';
import '../components/all_societise_data.dart';

class AllSocietise extends StatelessWidget {
  const AllSocietise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "All Societise",
        hasbackButton: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, right: 40),
            child: Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(hintText: "Search Societise"),
                ),
              ),
            ),
          ),
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
                      text: "ACTION",
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
                  return AllSocietiseData(
                    index: index,
                  );
                }),
          )
        ],
      ),
    );
  }
}
