import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:picker/components/navbar.dart';
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
  late Future<TotalDetail> futurequelist;
  //late Future<TotalDetail> total;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    futurequelist = QueueAPI().getPicklist("picklist", 0);
    // total = QueueAPI().getTotal("picklist/total", 0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder<TotalDetail>(
      future: futurequelist,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              NavbarApps(
                  title: "Queue",
                  articleTotal: snapshot.data!.totalArticle,
                  totalPicklist: snapshot.data!.totalPicklist,
                  totalQty: snapshot.data!.totalqty),
              Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.details.length,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () async {
                            final result = await Navigator.push<int>(
                                context,
                                MaterialPageRoute(
                                    // navigasi ke detail page, tapi detail pagenya pakai template
                                    // scaffold kalo perlu bawa index bottomnavbar nya sekalian
                                    builder: (context) => QueueList(
                                          orderNumber: snapshot
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
                            height: 85,
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
                                              fontSize: 12),
                                        ),
                                      ),
                                      Align(
                                        child: Text(
                                          "Qty ${snapshot.data!.details[index].qty}",
                                          style: TextStyle(
                                              color: Color(0xFF2CBF6C),
                                              fontSize: 12),
                                        ),
                                      ),
                                      Align(
                                        child: Text(
                                          "Received ${snapshot.data!.details[index].dateTrans}",
                                          style: TextStyle(
                                              color: Color(0xFF2CBF6C),
                                              fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                    size: 24.0,
                                    semanticLabel: 'Continue',
                                  ),
                                ]),
                          ),
                        );
                      })))
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }),
    ));
  }
}
