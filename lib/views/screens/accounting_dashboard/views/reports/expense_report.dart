import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../widgets/my_appbar.dart';
import '../../../smartgate_payments/components/table_header.dart';
import '../../component/expanse/expanse_report_table_data.dart';
import '../../controller/all_reports_controller.dart';

class ExpanseReport extends StatelessWidget {
  const ExpanseReport({super.key});

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
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Expanse Report",
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
                                child: DropdownButton<String>(
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
                      Container(
                          //  margin: const EdgeInsets.only(top: 40),
                          color: Colors.white,
                          child: Card(
                            surfaceTintColor: Colors.white,
                            color: Colors.white,
                            elevation: 10,
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              value: reportsController.selectedYear.value,
                              onChanged: (String? newValue) {
                                reportsController.selectedYear.value =
                                    newValue ?? "";
                              },
                              items: <String>[
                                'Select Year',
                                '2023',
                                '2024',
                                '2025',
                                '2026',
                                '2027',
                                '2028',
                                '2029',
                                '2030',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            )),
                          )),
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
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.grey[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Table(
                        children: [
                          TableRow(children: [
                            TableHeader(
                              text: "START",
                            ),
                            TableHeader(
                              text: "END",
                            ),
                            TableHeader(
                              text: "ACCOUNT",
                            ),
                            TableHeader(
                              text: "STATUS",
                            ),
                            TableHeader(
                              text: "EXPANSE",
                            ),
                            TableHeader(
                              text: "OTHER EXPANSE",
                            ),
                          ])
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 20,
                        shrinkWrap: false,
                        itemBuilder: (context, index) {
                          return const ExpanseReportTableData();
                        }),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(),
                        SizedBox(),
                        SizedBox(),
                        SizedBox(),
                        Column(
                          children: [
                            Text(
                              "TOTAL EXPANSE",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "RS 1550000/",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "OTHER EXPANSE",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "RS 1450000/",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
