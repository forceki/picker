import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class QueuePage extends StatefulWidget {
  const QueuePage({Key? key}) : super(key: key);

  @override
  State<QueuePage> createState() => _QueuePageState();
}

class _QueuePageState extends State<QueuePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              child: const Text(
                'Queue',
                style: TextStyle(color: Color(0xFF2CBF6C), fontSize: 34),
              )),
          Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: const Text(
                        'Picklist',
                        style: TextStyle(
                            color: Color(0xFF2CBF6C),
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: const Text(
                        '15',
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: const Text(
                        'Articles',
                        style: TextStyle(
                            color: Color(0xFF2CBF6C),
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: const Text(
                        '888',
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: const Text(
                        'Quantity',
                        style: TextStyle(
                            color: Color(0xFF2CBF6C),
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: const Text(
                        '888',
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    )
                  ],
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            child: const Text(
                              "20220804A010000001",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          Align(
                            child: const Text(
                              "Art 88",
                              style: TextStyle(
                                color: Color(0xFF84D9B1),
                                fontSize: 14
                              ),
                            ),
                          ),
                          Align(
                            child: const Text(
                              "Qty 888",
                              style: TextStyle(
                                color: Color(0xFF84D9B1),
                                fontSize: 14
                              ),
                            ),
                          ),
                          Align(
                            child: const Text(
                              "Received 88:88:88",
                              style: TextStyle(
                                color: Color(0xFF84D9B1),
                                fontSize: 14
                              ),
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 24.0,
                        semanticLabel: 'Continue',
                      ),
                    ]),
              );
            }),
          ))
        ],
      ),
    );
  }
}
