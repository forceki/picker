import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:picker/services/api.dart';
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
                margin: const EdgeInsets.fromLTRB(40, 139, 0, 20),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 48),
                )),
            Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 40),
                child: const Text(
                  'Welcome back!',
                  style: TextStyle(fontSize: 32),
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(40, 75, 40, 0),
              child: TextField(
                controller: nameController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF2CBF6C)),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF2CBF6C)),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Username",
                    labelStyle: const TextStyle(color: Color(0xFF2CBF6C))),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: TextFormField(
                focusNode: myFocusNode,
                controller: passwordController,
                textInputAction: TextInputAction.next,
                obscureText: _secureText,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF2CBF6C)),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF2CBF6C)),
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Password",
                  labelStyle: const TextStyle(color: Color(0xFF2CBF6C)),
                  suffixIcon: IconButton(
                    onPressed: showHide,
                    icon: Icon(
                      _secureText ? Icons.visibility_off : Icons.visibility,
                      color: const Color(0xFF2CBF6C),
                    ),
                  ),
                ),
              ),
            ),
            Container(
                height: 50,
                margin: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                child: ElevatedButton(
                  child: Text(_isLoading ? 'Please wait...' : 'Sign In'),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF2CBF6C),
                    textStyle: const TextStyle(fontSize: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
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
    log("data : $body");
    if (success == 1) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['access_code']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.pushReplacement(
        context,
        new MaterialPageRoute(builder: (context) => const Layout()),
      );
    } else {
      _showMsg(body['message']);
    }

    setState(() {
      _isLoading = false;
    });
  }
}
