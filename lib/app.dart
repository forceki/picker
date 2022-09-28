import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picker/routes.dart';
import 'package:picker/view/auth/check_auth.dart';
import 'package:picker/view/auth/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Picker',
        onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
        home: CheckAuth());
  }
}
