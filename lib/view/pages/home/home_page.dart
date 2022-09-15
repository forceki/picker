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
      child: ListView(
        children: [
          Center(
              child: Container(
            padding: EdgeInsets.only(top: 24),
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
          Container(
            height: 240,
            margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            decoration: const BoxDecoration(
                color: Colors.black, shape: BoxShape.circle),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child: Text(
                    'Articles',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  )),
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        '88/888',
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      )),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child: Text(
                    'Quantity',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  )),
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        '88/888',
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      )),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Started',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    '88:88:88',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Duration',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    '88:88:88',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ],
              )
            ],
          ),
          Container(
            color: Colors.transparent,
            margin: EdgeInsets.fromLTRB(0, 25, 0, 30),
            child: ElevatedButton(
              child: Text('Continue'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(105, 40),
                primary: Color(0xFF2CBF6C),
                textStyle:
                  TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
              ),
              onPressed: () {
                print('dd');
              },
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    height: 182,
                    width: 182,
                    decoration: BoxDecoration(color: Color(0xFF2CBF6C), borderRadius: BorderRadius.all(Radius.circular(12))),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 182,
                    width: 182,
                    decoration: BoxDecoration(color: Color(0xFFF2F2F2), borderRadius: BorderRadius.all(Radius.circular(12))),
                  )
                ],
              )
            ]
          )
        ],
      ),
    );
  }
}
