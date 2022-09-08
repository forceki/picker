import 'package:flutter/material.dart';
import 'package:picker/view/auth/login_page.dart';
import 'package:picker/view/home/home_page.dart';
import 'package:picker/view/layout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckAuth extends StatefulWidget {
  const CheckAuth({Key? key}) : super(key: key);

  @override
  State<CheckAuth> createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var token = localStorage.getString('token');

    if (token != null) {
      if (mounted) {
        setState(() {
          isAuth = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = Layout();
    } else {
      child = LoginPage();
    }

    return Scaffold(
      body: child,
    );
  }
}
