import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:picker/services/api.dart';
import 'package:picker/view/home/home_page.dart';
import 'package:picker/view/layout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  FocusNode myFocusNode = new FocusNode();
  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
            child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Welcome Back!!',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Username",
                    labelStyle: TextStyle(color: Colors.green)),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                focusNode: myFocusNode,
                controller: passwordController,
                obscureText: _secureText,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.green),
                  suffixIcon: IconButton(
                    onPressed: showHide,
                    icon: Icon(
                      _secureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ElevatedButton(
                  child: Text(_isLoading ? 'Please wait ...' : 'Sign In'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    _login();
                  },
                )),
          ],
        )));
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      'username': nameController.text,
      'password': passwordController.text,
      'code': "sp3-app"
    };

    var res = await Api().auth(data, 'auth');

    var body = json.decode(res.body);
    var success = body['success'];
    log("data : $success");
    if (success == 1) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['access_code']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.pushReplacement(
        context,
        new MaterialPageRoute(builder: (context) => Layout()),
      );
    } else {
      _showMsg(body['message']);
    }

    setState(() {
      _isLoading = false;
    });
  }
}
