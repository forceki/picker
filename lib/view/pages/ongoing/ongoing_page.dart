import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class OnGoingPage extends StatefulWidget {
  const OnGoingPage({Key? key}) : super(key: key);

  @override
  State<OnGoingPage> createState() => _OnGoingPageState();
}

class _OnGoingPageState extends State<OnGoingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                  children: [
                     Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: const Text(
                          "Ongoing",
                          style:
                              TextStyle(color: Color(0xFF2CBF6C), fontSize: 34),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: const Text(
                          "20220804A010000001",
                          style: TextStyle(color: Colors.black, fontSize: 24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                  //margin: const EdgeInsets.only(right: 2),
                  child: Text("CHART"),
                  height: 50,
                  color: Colors.blueAccent,
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(16, 12, 16, 36),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  //margin: const EdgeInsets.all(1.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: const Text(
                            "Articles",
                            style: TextStyle(
                                color: Color(0xFF2CBF6C), fontSize: 16),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: const Text(
                            "88/888",
                            style: TextStyle(color: Colors.black, fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  //margin: const EdgeInsets.all(1.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: const Text(
                            "Quantity",
                            style: TextStyle(
                                color: Color(0xFF2CBF6C), fontSize: 16),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: const Text(
                            "888/8.888",
                            style: TextStyle(color: Colors.black, fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  //margin: const EdgeInsets.all(1.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: const Text(
                            "Duration",
                            style: TextStyle(
                                color: Color(0xFF2CBF6C), fontSize: 16),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: const Text(
                            "88:88:88",
                            style: TextStyle(color: Colors.black, fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: 6,
            itemBuilder: ((context, index) {
              return Container(
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                padding: const EdgeInsets.all(10),
                height: 82,
                decoration: const BoxDecoration(
                    color: Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 64, width: 64, color: Color(0xFF84D9B1)),
                      Column(
                        children: [
                          Flexible(
                            //alignment: Alignment.centerLeft,
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                text: "B-02-CA-04-B01, B-02-CA-03-B02",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: const Text(
                                "Article Name",
                                style: TextStyle(
                                    color: Color(0xFF2CBF6C), fontSize: 14),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              child: const Text(
                                "Size & Color",
                                style: TextStyle(
                                    color: Color(0xFF2CBF6C), fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                          child: const Text(
                        '88',
                        style: TextStyle(color: Colors.black, fontSize: 48, fontWeight: FontWeight.w300),
                      )),
                    ]),
              );
            }),
          ))
        ],
      ),
    );
  }
}
