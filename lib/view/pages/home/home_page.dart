import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:picker/components/chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.changeNavbar}) : super(key: key);

  final Function(int) changeNavbar;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
          ChartWidget(),
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
                  shadowColor: Colors.transparent,
                  fixedSize: Size(105, 40),
                  primary: Color(0xFF2CBF6C),
                  textStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                onPressed: () {
                  widget.changeNavbar(1);
                },
              )),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Expanded(
              child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                        // height: 182,
                        // width: 182,
                        margin: EdgeInsets.fromLTRB(16, 0, 16, 25),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Color(0xFF2CBF6C),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 24),
                                child: Text(
                                  'Queue',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Text(
                                  '88 picklist',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 24),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Text(
                                  '888 articles',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 24),
                                ),
                              ),
                              Container(
                                child: Text(
                                  '8.888 pieces',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 24),
                                ),
                              ),
                            ]),
                      )),
            ),
            Expanded(
              child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                        // height: 182,
                        // width: 182,
                        margin: EdgeInsets.fromLTRB(16, 0, 16, 25),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 24),
                                child: Text(
                                  'Finished',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Text(
                                  '88 picklist',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 24),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Text(
                                  '888 articles',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 24),
                                ),
                              ),
                              Container(
                                child: Text(
                                  '8.888 pieces',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 24),
                                ),
                              ),
                            ]),
                      )),
            ),
          ])
        ],
      ),
    );
  }
}
