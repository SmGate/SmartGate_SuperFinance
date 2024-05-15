import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../../widgets/my_appbar.dart';
import '../../../smartgate_payments/components/table_header.dart';
import '../../component/revenue/revenue_details_data.dart';

class Revenue extends StatelessWidget {
  const Revenue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Sales',
        hasbackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
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
                  // shrinkWrap: true,
                  itemCount: 33,
                  itemBuilder: (context, index) {
                    return RevenueDetailsData(
                      index: index,
                    );
                  }),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Text(
                      "Total Revenu",
                      style: GoogleFonts.inder(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          fontStyle: FontStyle.normal,
                          color: HexColor('#262626')),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Text(
                      "20000",
                      style: GoogleFonts.inder(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          fontStyle: FontStyle.normal,
                          color: HexColor('#262626')),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
