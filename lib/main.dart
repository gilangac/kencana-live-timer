// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors, unused_import, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kencana_live_timer/modules/home/controllers/home_controller.dart';
import 'package:kencana_live_timer/routes/pages.dart';
import 'package:kencana_live_timer/services/service_preference.dart';
import 'package:kencana_live_timer/themes/theme.dart';
import 'package:kencana_live_timer/utils/sizes.dart';
import 'package:window_manager/window_manager.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceService.init();
  initializeDateFormatting('id', null);
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
      // fullScreen: true,
      // windowButtonVisibility: true,
      // center: true,
      // skipTaskbar: false,
      // titleBarStyle: TitleBarStyle.normal,
      );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    // await windowManager.show();
    // await windowManager.focus();
    windowManager.setFullScreen(true);

    // await windowManager.maximize();
    await windowManager.setMaximizable(true);
    await windowManager.setMinimizable(false);
    // await windowManager.setClosable(true);
    await windowManager.setResizable(false);
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return ScreenUtilInit(
        designSize: Size(Get.width, Get.height),
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Kencana Live Timer',
            theme: AppTheme.lightTheme,
            initialRoute: AppPages.HOME,
            getPages: AppRoutes.pages,
            defaultTransition: Transition.cupertino,
          );
        });
  }
}
