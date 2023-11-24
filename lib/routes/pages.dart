// ignore_for_file: constant_identifier_names

import 'package:get/route_manager.dart';
import 'package:kencana_live_timer/modules/home/views/home_page.dart';

part 'routes.dart';

class AppPages {
  static const SPLASH = _Paths.SPLASH;
  static const HOME = _Paths.HOME;
}

abstract class _Paths {
  static const SPLASH = '/splash';
  static const HOME = '/home';
}
