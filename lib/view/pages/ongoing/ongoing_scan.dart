import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:picker/components/barcode%20_scan.dart';
import 'package:picker/components/ongoingappbar/ongoing_appbar.dart';

class OngoingScan extends StatefulWidget {
  const OngoingScan({Key? key}) : super(key: key);

  @override
  State<OngoingScan> createState() => _OngoingScanState();
}

class _OngoingScanState extends State<OngoingScan> {
  final _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Logged in uus',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.power_settings_new, color: Colors.black),
        //     onPressed: () {
        //       print("anu");
        //     },
        //   )
        // ],
      ),
      body: Container(
        child: Column(children: [
          const OngoingAppbar(title: "Ongoing"),
          Expanded(
              child: ListView(
            children: const [ScanBarcode()],
          ))
        ]),
      ),
    );
  }
}
