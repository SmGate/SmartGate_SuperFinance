// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:super_finance/widgets/custom_button.dart';

import '../../../../utils/styles/colors.dart';
import '../../../../utils/validators.dart';
import '../../../../widgets/my_passward_field.dart';
import '../../../../widgets/text_from_field.dart';
import '../controller/login_controller.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return Scaffold(
            backgroundColor: HexColor('#F5F5F5'),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/Rectangle 1.png',
                        alignment: Alignment.topLeft,
                        fit: BoxFit.cover,
                        width: 850.w,
                      ),
                      Flexible(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 27,
                              ),
                              SvgPicture.asset(
                                'assets/login_vector_2.svg',
                                width: 387.91.h,
                                height: 387.91.h,
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Text(
                                "Log In",
                                style: GoogleFonts.montserrat(
                                    fontSize: 36.sp,
                                    fontWeight: FontWeight.w600,
                                    color: secondaryColor),
                              ),
                              const SizedBox(
                                height: 48,
                              ),
                              MyTextFormField(
                                  controller: controller.cnicController,
                                  validator: validateExpression,
                                  hintText: 'CNIC',
                                  labelText: 'CNIC'),
                              const SizedBox(
                                height: 55,
                              ),
                              MyPasswordTextFormField(
                                  togglePasswordView:
                                      controller.togglePasswordView,
                                  validator: emptyStringValidator,
                                  controller: controller.passwordController,
                                  hintText: 'Password',
                                  labelText: 'Password',
                                  obscureText: controller.isHidden),
                              const SizedBox(
                                height: 87,
                              ),
                              myElevatedButton(
                                height: 60,
                                width: 300,
                                textColor: whiteColor,
                                backgroundColor: primaryColor,
                                text: 'Log In',
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {}

                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => HomePage()));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ));
      },
    );
  }
}
