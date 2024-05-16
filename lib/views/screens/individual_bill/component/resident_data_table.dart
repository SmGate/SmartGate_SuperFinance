// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_finance/views/screens/individual_bill/solo_bills/view/generate_solo_bill.dart';

import '../../smartgate_payments/components/table_header.dart';

class ResidentDataTable extends StatelessWidget {
  int? index;
  ResidentDataTable({super.key, this.index});

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
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () {
                      Get.to(() => GenerateSoloBill(
                            specificType: "Solo",
                          ));
                    },
                    child: const Text(
                      "GENERATE",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ])
          ],
        ),
      ),
    );
  }
}
