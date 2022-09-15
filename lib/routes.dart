import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:picker/view/auth/login_page.dart';
import 'package:picker/view/pages/home/home_page.dart';
import 'package:picker/view/pages/ongoing/ongoing_scan.dart';

class AppRoutes {
  static const loginpage = '/login';
  static const homePage = '/home';
  static const ongoingScan = '/ongoing-scan';
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    final args = setting.arguments;
    switch (setting.name) {
      case AppRoutes.loginpage:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const LoginPage(),
            settings: setting,
            fullscreenDialog: true);
      case AppRoutes.ongoingScan:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const OngoingScan(),
            settings: setting,
            fullscreenDialog: true);
      default:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const LoginPage(),
            settings: setting,
            fullscreenDialog: true);
    }
  }
}
