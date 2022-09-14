import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/retry.dart';
import 'package:picker/view/auth/login_page.dart';
import 'package:picker/view/pages/finished/finished_page.dart';
import 'package:picker/view/pages/home/home_page.dart';
import 'package:picker/view/pages/ongoing/ongoing_page.dart';
import 'package:picker/view/pages/queue/queue_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  String name = '';
  int currentIndex = 0;

  final itemContent = [
    HomePage(),
    QueuePage(),
    FinishedPage(),
    Center(child: Text("My Account")),
  ];

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var user = jsonDecode(localStorage.getString('user')!);
    if (user != null) {
      setState(() {
        name = user['fullname'];
      });
    }
  }

  Widget getContent() {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return OnGoingPage(changeNavbar: (index) {
          setState(() {
            currentIndex = index;
          });
        });
      case 2:
        return QueuePage();
      case 3:
        return FinishedPage();
      case 4:
        return Center(child: Text("My Account"));
      default:
        return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Logged in $name',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.power_settings_new, color: Colors.black),
            onPressed: () {
              logout();
            },
          )
        ],
      ),
      body: getContent(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.stacked_bar_chart), label: "Ongoing"),
            BottomNavigationBarItem(
                icon: Icon(Icons.layers_rounded), label: "Queue"),
            BottomNavigationBarItem(
                icon: Icon(Icons.stacked_bar_chart), label: "Finished"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "My Account")
          ]),
    );
  }

  void logout() async {
    print("logit");
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('user');
    localStorage.remove('token');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
