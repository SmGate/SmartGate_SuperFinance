import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../widgets/my_appbar.dart';
import '../../controller/all_reports_controller.dart';

class ProffitLossReport extends StatelessWidget {
  const ProffitLossReport({super.key});

  @override
  Widget build(BuildContext context) {
    var reportsController = Get.put(ReportsController());
    return Scaffold(
      appBar: MyAppBar(
        title: '',
        hasbackButton: true,
      ),
      body: SafeArea(
          child: Padding(
        padding:
            const EdgeInsets.only(top: 40, bottom: 20, left: 40, right: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Profit Loss Report",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          "Date ",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "12 APR 2024",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Status ",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Paid",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  //  margin: const EdgeInsets.only(top: 40),
                  color: Colors.white,

                  child: Card(
                      surfaceTintColor: Colors.white,
                      color: Colors.white,
                      elevation: 10,
                      child: DropdownButtonHideUnderline(
                        child: Obx(() => DropdownButton<String>(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              value: reportsController.selectedMonth.value,
                              onChanged: (String? newValue) {
                                reportsController.selectedMonth.value =
                                    newValue ?? "";
                              },
                              items: <String>[
                                'Select Month',
                                'January',
                                'February',
                                'March',
                                'April',
                                'May',
                                'June',
                                'July',
                                'August',
                                'September',
                                'October',
                                'November',
                                'December',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            )),
                      )),
                ),
                const SizedBox(
                  width: 40,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange),
                    onPressed: () {},
                    child: const Text(
                      "Download PDF",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
            const Divider(
              thickness: 4,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              color: Colors.grey[100],
              width: 600,
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Revenue",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 600,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [Text("Bank Transfer"), Spacer(), Text("200000")],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [Text("Cash"), Spacer(), Text("14500000")],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  const Row(
                    children: [Text("Total"), Spacer(), Text("14500000")],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    color: Colors.grey[100],
                    width: 600,
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Expanse",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [Text("Salaries"), Spacer(), Text("200000")],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [Text("Events"), Spacer(), Text("14500000")],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [Text("Maintenance"), Spacer(), Text("100000")],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [Text("Other"), Spacer(), Text("1590000")],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  const Row(
                    children: [Text("Total"), Spacer(), Text("14500000")],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
