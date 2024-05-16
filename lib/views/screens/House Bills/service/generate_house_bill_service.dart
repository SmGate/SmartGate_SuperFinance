
// import 'package:http/http.dart' as http;

// import '../Model/ganerate_house_bill.dart';

// class GenerateHouseBillService {
//   static Future<dynamic> generateHouseBill({
//     String? subAdminId,
//     String? financeManagerId,
//     String? dueDate,
//     String? billStartDate,
//     String? billEndDate,
//   }) async {
//     var url = Api.generateHouseBill;
//     try {
//       Map data = {
//         'subadminid': subAdminId,
//         'financemanagerid': financeManagerId,
//         'duedate': dueDate,
//         'billstartdate': billStartDate,
//         'billenddate': billEndDate,
//         'status': "unpaid",
//         'specific_type': "monthly",
//         'description': "house bill",
//       };

//       var res = await BaseClientClass.post(url, data);

//       if (res is http.Response) {
//         return generateHouseBillFromJson(res.body);
//       } else {
//         return res;
//       }
//     } catch (e) {
//       return e;
//     }
//   }
// }
