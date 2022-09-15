import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class OngoingAppbar extends StatelessWidget {
  const OngoingAppbar({Key? key, required this.title}) : super(key: key);

  final String title;

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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        child: Container(
                          child: Text(
                            "$title",
                            style: TextStyle(
                                color: Color(0xFF2CBF6C), fontSize: 34),
                          ),
                        ),
                      ),
                      Align(
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
                crossAxisAlignment: CrossAxisAlignment.center,
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 24),
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 24),
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 24),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
