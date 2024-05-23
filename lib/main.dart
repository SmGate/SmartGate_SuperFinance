import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:window_manager/window_manager.dart';
import 'views/screens/homepage/homepage_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(
    size: Size(1200, 1200),
    minimumSize: Size(1100, 1100),
    fullScreen: true,
    center: true,
    backgroundColor: Colors.transparent,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
    windowManager.popUpWindowMenu();
  });
  runApp(const MyApp());
}

class MyApp extends StatefulWidget with WindowListener {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WindowListener {
  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    _init();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  void _init() async {
    await windowManager.setPreventClose(true);
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 360, // Minimum width constraint
        minHeight: 640, // Minimum height constraint
      ),
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(1440, 1024),
        builder: (context, child) {
          return LayoutBuilder(
            builder: (context, constraints) {
              // Check if the height is less than 1200 pixels
              bool isHeightLessThan1200 = constraints.maxHeight < 1200;

              return GetMaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                home: isHeightLessThan1200
                    ? const SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            width: 1440, // Set width to match design size
                            height: 1200, // Set height to match design size
                            child: HomePage(),
                          ),
                        ),
                      )
                    : const HomePage(),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void onWindowClose() async {
    bool isPreventClose = await windowManager.isPreventClose();

    if (isPreventClose) {
      Get.defaultDialog(
          middleText: 'Are you sure you want to close this window?',
          actions: [
            ActionChip(
              label: const Text("Ok"),
              onPressed: () async {
                Get.back();
                await windowManager.destroy();
              },
            ),
            ActionChip(
              label: const Text("Cancel"),
              onPressed: () {
                Get.back();
              },
            ),
          ]);
    }
  }
}
