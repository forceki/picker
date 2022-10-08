import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChangePw extends StatefulWidget {
  const ChangePw({super.key});

  @override
  State<ChangePw> createState() => _ChangePwState();
}

class _ChangePwState extends State<ChangePw> {
  var cpwController = TextEditingController();
  var npwController = TextEditingController();
  var confController = TextEditingController();

  bool _isLoading = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  FocusNode cpwFocus = new FocusNode();
  FocusNode npwFocus = new FocusNode();
  FocusNode confFocus = new FocusNode();
  bool _cpwVisible = true;
  bool _npwVisible = true;
  bool _confVisible = true;

  showHide() {
    setState(() {
      _cpwVisible = !_cpwVisible;
    });
  }

  showHide2() {
    setState(() {
      _npwVisible = !_npwVisible;
    });
  }

  showHide3() {
    setState(() {
      _confVisible = !_confVisible;
    });
  }

  final _currentIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Logged in mitra',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          automaticallyImplyLeading: true,
          leading: IconButton(
              icon: Icon(Icons.adaptive.arrow_back_rounded),
              color: Colors.black,
              onPressed: () => Navigator.pop(context)),
          backgroundColor: Colors.transparent,
          elevation: 0),
      body: Center(
          child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(40, 0, 0, 30),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Change Password',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: TextFormField(
              focusNode: cpwFocus,
              controller: cpwController,
              obscureText: _cpwVisible,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF2CBF6C)),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF2CBF6C)),
                    borderRadius: BorderRadius.circular(10)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: "Current Password",
                labelStyle: const TextStyle(color: Color(0xFF2CBF6C)),
                suffixIcon: IconButton(
                  onPressed: showHide,
                  icon: Icon(
                    _cpwVisible ? Icons.visibility : Icons.visibility_off,
                    color: const Color(0xFF2CBF6C),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: TextFormField(
              focusNode: npwFocus,
              controller: npwController,
              obscureText: _npwVisible,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF2CBF6C)),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF2CBF6C)),
                    borderRadius: BorderRadius.circular(10)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: "New Password",
                labelStyle: const TextStyle(color: Color(0xFF2CBF6C)),
                suffixIcon: IconButton(
                  onPressed: showHide2,
                  icon: Icon(
                    _npwVisible ? Icons.visibility : Icons.visibility_off,
                    color: const Color(0xFF2CBF6C),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: TextFormField(
              focusNode: confFocus,
              controller: confController,
              obscureText: _confVisible,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF2CBF6C)),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF2CBF6C)),
                    borderRadius: BorderRadius.circular(10)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: "Confirm New Password",
                labelStyle: const TextStyle(color: Color(0xFF2CBF6C)),
                suffixIcon: IconButton(
                  onPressed: showHide3,
                  icon: Icon(
                    _confVisible ? Icons.visibility : Icons.visibility_off,
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
                child: Text(_isLoading ? 'Please wait ...' : 'Change Password'),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF2CBF6C),
                  textStyle: const TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  //_login();
                },
              )),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => {Navigator.pop(context, index)},
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
}
