import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:picker/components/chart.dart';
import 'package:picker/model/dashboard.dart';
import 'package:picker/services/queue.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.changeNavbar}) : super(key: key);

  final Function(int) changeNavbar;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Dashboard> dashboard;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() {
    dashboard = QueueAPI().dashboard("picklist/dashboard");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: FutureBuilder<Dashboard>(
      future: dashboard,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Center(
                  child: Container(
                padding: const EdgeInsets.only(top: 24),
                child: const Text(
                  "Ongoing Picklist",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
              )),
              Center(
                child: Text(
                  "${snapshot.data!.picklist}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
              const ChartWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Column(
                        children: [
                          Container(
                              child: const Text(
                            'Articles',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          )),
                          Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                '${snapshot.data!.totalArticle}',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Started',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            '${snapshot.data!.started}',
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Column(
                        children: [
                          Container(
                              child: const Text(
                            'Quantity',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          )),
                          Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                '${snapshot.data!.totalQty}',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Duration',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            '${snapshot.data!.duration}',
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Container(
                  color: Colors.transparent,
                  margin: const EdgeInsets.fromLTRB(0, 25, 0, 30),
                  child: ElevatedButton(
                    child: const Text('Continue'),
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      fixedSize: const Size(105, 40),
                      primary: const Color(0xFF2CBF6C),
                      textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
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
                            margin: const EdgeInsets.fromLTRB(16, 0, 16, 25),
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                                color: Color(0xFF2CBF6C),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 24),
                                    child: const Text(
                                      'Queue',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 24),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      '${snapshot.data!.queue.picklistTotal} picklist',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 24),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      '${snapshot.data!.queue.articleTotal} articles',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '${snapshot.data!.queue.qtyTotal} pieces',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
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
                            margin: const EdgeInsets.fromLTRB(0, 0, 16, 25),
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                                color: Color(0xFFF2F2F2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 24),
                                    child: const Text(
                                      'Finished',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 24),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      '${snapshot.data!.finished.picklistTotal} picklist',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 24),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      '${snapshot.data!.finished.articleTotal} articles',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '${snapshot.data!.finished.qtyTotal} pieces',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                  ),
                                ]),
                          )),
                ),
              ])
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    ));
  }
}
