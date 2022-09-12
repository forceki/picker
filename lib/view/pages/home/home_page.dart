import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
              child: Container(
            padding: EdgeInsets.fromLTRB(0, 24, 0, 10),
            child: const Text(
              "Ongoing Picklist",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 16,
              ),
            ),
          )),
          const Center(
            child: Text(
              "20220804A010000001",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
