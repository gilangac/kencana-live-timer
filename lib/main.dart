// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors, unused_import, must_be_immutable

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kencana_live_timer/modules/home/controllers/home_controller.dart';
import 'package:kencana_live_timer/routes/pages.dart';
import 'package:kencana_live_timer/services/service_preference.dart';
import 'package:kencana_live_timer/themes/theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceService.init();
  initializeDateFormatting('id', null);
  await DesktopWindow.setWindowSize(const Size(1300, 800));

  await DesktopWindow.setMinWindowSize(const Size(1300, 800));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kencana Live Timer',
      theme: AppTheme.lightTheme,
      initialRoute: AppPages.HOME,
      getPages: AppRoutes.pages,
      defaultTransition: Transition.cupertino,
    );
  }
}
