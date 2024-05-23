import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/user_response.dart';

class LoginController extends GetxController {
  var isHidden = true;

  final TextEditingController cnicController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool loading = false.obs;

  var userModel = User();
  RxString error = "".obs;

  // loginApi({required cnic, required password}) async {
  //   loading = true;
  //   update();
  //   Map<String, String> data = {"cnic": cnic, "password": password};

  //   _repository.loginApi(data).then((value) async {
  //     loading = false;
  //     update();
  //     if (kDebugMode) {
  //       print(value);
  //       final user = User.fromJson(value);

  //       log(user.toString());
  //       MySharedPreferences.setUserData(user: user);

  //       User user2 = await MySharedPreferences.getUserData();
  //       Get.off(() => const HomePage(), arguments: user2);
  //       //  Get.offNamed(homePage, arguments: user2);

  //       Get.snackbar('Login', user.data!.firstname!.toString());
  //     }
  //   }).onError((error, stackTrace) {
  //     loading = false;
  //     update();
  //     Get.snackbar('Error', '$error ', backgroundColor: Colors.white);
  //     if (kDebugMode) {
  //       print(error.toString());
  //       print(stackTrace.toString());
  //     }
  //   });
  // }

  void loginUser({required cnic, required password}) async {
    // loading.value = true;
    // error.value = "";

    // var res = await UserService.loginUser(cnic, password);
    // loading.value = false;

    // if (res is User) {
    //   userModel = res;
    //   MySharedPreferences.setUserData(user: userModel);
    //   User user2 = await MySharedPreferences.getUserData();
    //   Get.off(() => const HomePage(), arguments: user2);
    //   Get.snackbar('Login', userModel.data!.firstname!.toString());
    // } else {
    //   loading.value = false;
    //   error.value = res.toString();
    //   Get.snackbar('Error', '$error ', backgroundColor: Colors.white);
    // }
  }

  void togglePasswordView() {
    isHidden = !isHidden;
    update();
  }
}
