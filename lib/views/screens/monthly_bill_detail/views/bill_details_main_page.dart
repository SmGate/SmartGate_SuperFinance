import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_finance/views/screens/monthly_bill_detail/views/previous_bill.dart';
import '../../../../utils/styles/colors.dart';
import '../../../../widgets/my_appbar.dart';
import 'current_bill.dart';

class BillDetailsMainPage extends StatefulWidget {
  const BillDetailsMainPage({super.key});

  @override
  State<BillDetailsMainPage> createState() => _BillDetailsMainPageState();
}

class _BillDetailsMainPageState extends State<BillDetailsMainPage> {
  String _selectedItem = 'Current Bill';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Bill Details',
        hasbackButton: true,
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(right: 50, top: 50, bottom: 40, left: 20),
            child: Row(
              children: [
                _selectedItem == "Current Bill"
                    ? Text("Current Bill",
                        style: GoogleFonts.montserrat(
                            color: secondaryColor,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            fontSize: 36.sp))
                    : Text("Previouse Bill",
                        style: GoogleFonts.montserrat(
                            color: secondaryColor,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            fontSize: 36.sp)),
                const Spacer(),
                const SizedBox(
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(hintText: "Search Name Here"),
                    )),
                const SizedBox(
                  width: 100,
                ),
                DropdownButton<String>(
                  value: _selectedItem,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedItem = newValue!;
                    });
                  },
                  items: <String>['Current Bill', 'Previous Bill']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          _selectedItem == "Current Bill"
              ? const CurrentBill()
              : const PreviouseBill()
        ],
      ),
    );
  }
}
