import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:picker/model/picklist.dart';
import 'package:picker/services/queue.dart';
import 'package:picker/view/pages/queue/queue_list.dart';

class QueuePage extends StatefulWidget {
  const QueuePage({Key? key, required this.changeNavbar}) : super(key: key);

  final Function(int) changeNavbar;
  @override
  State<QueuePage> createState() => _QueuePageState();
}

class _QueuePageState extends State<QueuePage> {
  late Future<List<Picklist>> futurequelist;

  @override
  void initState() {
    futurequelist = QueueAPI().getPicklist("picklist");
    super.initState();
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
                        '15',
                        style: TextStyle(color: Colors.black, fontSize: 25),
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
                        '888',
                        style: TextStyle(color: Colors.black, fontSize: 25),
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
            child: FutureBuilder<List<Picklist>>(
              future: futurequelist,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () async {
                            final result = await Navigator.push<int>(
                                context,
                                MaterialPageRoute(
                                    // navigasi ke detail page, tapi detail pagenya pakai template
                                    // scaffold kalo perlu bawa index bottomnavbar nya sekalian
                                    builder: (context) => QueueList(
                                          orderNumber:
                                              snapshot.data![index].orderNumber,
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
                                          "${snapshot.data![index].orderNumber}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Align(
                                        child: Text(
                                          "${snapshot.data![index].countArticle}",
                                          style: TextStyle(
                                              color: Color(0xFF2CBF6C),
                                              fontSize: 14),
                                        ),
                                      ),
                                      Align(
                                        child: Text(
                                          "${snapshot.data![index].sumQty}",
                                          style: TextStyle(
                                              color: Color(0xFF2CBF6C),
                                              fontSize: 14),
                                        ),
                                      ),
                                      Align(
                                        child: const Text(
                                          "Received 88:88:88",
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
