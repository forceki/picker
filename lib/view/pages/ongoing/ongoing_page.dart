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
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: const Text(
                          "Should be left",
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: const Text(
                          "Should be left",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                  margin: const EdgeInsets.only(right: 2),
                  child: Text("CHART"),
                  height: 50,
                  color: Colors.blueAccent,
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.all(1.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: const Text(
                            "Should be left",
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: const Text(
                            "9999/999",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(1.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: const Text(
                            "Should be left",
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: const Text(
                            "9999/999",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(1.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: const Text(
                            "Should be left",
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: const Text(
                            "9999/999",
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
                margin: const EdgeInsets.all(10),
                height: 100,
                decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(height: 50, width: 50, color: Colors.black),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              child: const Text(
                                "9999/999",
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              child: const Text(
                                "9999/999",
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(height: 50, width: 50, color: Colors.black),
                    ]),
              );
            }),
          ))
        ],
      ),
    );
  }
}
