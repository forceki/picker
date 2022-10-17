import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:picker/model/picklist.dart';
import 'package:picker/services/queue.dart';
import 'package:picker/view/pages/finished/fineshed_list.dart';

class FinishedPage extends StatefulWidget {
  const FinishedPage({Key? key, required this.changeNavbar}) : super(key: key);
  final Function(int) changeNavbar;
  @override
  State<FinishedPage> createState() => FinishedPageState();
}

class FinishedPageState extends State<FinishedPage> {
  late Future<TotalDetail> futurequelist;
  //late Future<TotalDetail> total;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    futurequelist = QueueAPI().getPicklist("picklist", 2);
    //   total = QueueAPI().getTotal("picklist/total", 2);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              child: const Text(
                'Finished',
                style: TextStyle(color: Color(0xFF2CBF6C), fontSize: 34),
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              child: FutureBuilder<TotalDetail>(
                future: futurequelist,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Picklist',
                                style: TextStyle(
                                    color: Color(0xFF2CBF6C),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "${snapshot.data!.totalPicklist}",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Articles',
                                style: TextStyle(
                                    color: Color(0xFF2CBF6C),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                '${snapshot.data!.totalArticle}',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Quantity',
                                style: TextStyle(
                                    color: Color(0xFF2CBF6C),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                '${snapshot.data!.totalqty}',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: const [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Picklist',
                                style: TextStyle(
                                    color: Color(0xFF2CBF6C),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "0",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: const [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Articles',
                                style: TextStyle(
                                    color: Color(0xFF2CBF6C),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                '0',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: const [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Quantity',
                                style: TextStyle(
                                    color: Color(0xFF2CBF6C),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                '0',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  }
                },
              )),
          Expanded(
            child: FutureBuilder<TotalDetail>(
              future: futurequelist,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.details.length,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () async {
                            final result = await Navigator.push<int>(
                                context,
                                MaterialPageRoute(
                                    // navigasi ke detail page, tapi detail pagenya pakai template
                                    // scaffold kalo perlu bawa index bottomnavbar nya sekalian
                                    builder: (context) => FinishedList(
                                          order_number: snapshot
                                              .data!.details[index].picklist,
                                        )));
                            // abis page tujuan di pop, bawa indexnya ke parent
                            // widget buat ngeganti body widget kalo user pencet
                            // bottomnavbarnya waktu di page detail
                            if (result is int) widget.changeNavbar(result);
                          },
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                            padding: const EdgeInsets.all(10),
                            height: 82,
                            decoration: const BoxDecoration(
                                color: Color(0xFFF2F2F2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        child: Text(
                                          "${snapshot.data!.details[index].picklist}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Align(
                                        child: Text(
                                          "Art ${snapshot.data!.details[index].totalPicklist}",
                                          style: TextStyle(
                                              color: Color(0xFF2CBF6C),
                                              fontSize: 14),
                                        ),
                                      ),
                                      Align(
                                        child: Text(
                                          "Qty ${snapshot.data!.details[index].qty}",
                                          style: TextStyle(
                                              color: Color(0xFF2CBF6C),
                                              fontSize: 14),
                                        ),
                                      ),
                                      Align(
                                        child: Text(
                                          "Received ${snapshot.data!.details[index].dateTrans}",
                                          style: TextStyle(
                                              color: Color(0xFF2CBF6C),
                                              fontSize: 14),
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
                          ),
                        );
                      }));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
