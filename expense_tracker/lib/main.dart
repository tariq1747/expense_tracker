// import 'package:expense_tracker/utils/notification_service.dart';
import 'package:expense_tracker/utils/background_activity.dart';
import 'package:expense_tracker/utils/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// import 'package:timezone/data/latest.dart' as tz;

import 'utils/navigators/navigators.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationService.init();
  await WorkManagerService().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 745),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => child!,
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.purple),
          getPages: AppPages.pages,
          initialRoute: AppPages.initial,
        ),
      );
}
