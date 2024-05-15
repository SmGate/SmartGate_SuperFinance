import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import 'binding/app_bindings.dart';
import 'views/screens/homepage/homepage_page.dart';

void main() {
  runApp(const MyApp());
}

/////////////////
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(1440, 1024),
      builder: (context, child) {
        return GetMaterialApp(
          initialBinding: AppBinding(),
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomePage(),
        );
      },
    );
  }
}
