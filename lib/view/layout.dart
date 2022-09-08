import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:picker/view/auth/login_page.dart';
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
    Center(child: Text("Home")),
    Center(child: Text("On Going")),
    Center(child: Text("queue")),
    Center(child: Text("Finished")),
    Center(child: Text("my Account")),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'welcome back $name',
          style: TextStyle(fontSize: 18),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: () {
              logout();
            },
          )
        ],
      ),
      body: itemContent[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.stacked_bar_chart), label: "ongoing"),
            BottomNavigationBarItem(
                icon: Icon(Icons.layers_rounded), label: "queue"),
            BottomNavigationBarItem(
                icon: Icon(Icons.stacked_bar_chart), label: "finished"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "my account")
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
