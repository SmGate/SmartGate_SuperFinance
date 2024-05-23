// import 'package:smartgatefinance/Constants/api_routes.dart';
// import 'package:smartgatefinance/Constants/base_client.dart';
// import 'package:http/http.dart' as http;

// import '../model/user_response.dart';

// class UserService {
//   static Future<dynamic> loginUser(String cnic, String pass) async {
//     var url = Api.login;
//     try {
//       Map data = {"cnic": cnic, "password": pass};
//       var res = await BaseClientClass.post(url, data);
//       if (res is http.Response) {
//         return userFromJson(res.body);
//       } else {
//         return res;
//       }
//     } catch (e) {
//       return e;
//     }
//   }
// }
