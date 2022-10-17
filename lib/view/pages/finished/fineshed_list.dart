import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:picker/components/ongoingappbar/ongoing_appbar.dart';
import 'package:picker/model/picklist.dart';
import 'package:picker/services/queue.dart';

class FinishedList extends StatefulWidget {
  const FinishedList({Key? key, required this.order_number}) : super(key: key);

  final String order_number;

  @override
  State<FinishedList> createState() => _FinishedListState();
}

class _FinishedListState extends State<FinishedList> {
  final _currentIndex = 3;
  String _scanBarcode = "nothing";

  late Future<ArticleDetail> articleList;

  @override
  void initState() {
    super.initState();
    articleList = QueueAPI().getArticle('picklist/detail', widget.order_number);
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#000000', 'Cancel', false, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Logged in mitra',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          automaticallyImplyLeading: true,
          leading: IconButton(
              icon: Icon(Icons.adaptive.arrow_back_rounded),
              color: Colors.black,
              onPressed: () => Navigator.pop(context)),
          backgroundColor: Colors.transparent,
          elevation: 0),
      body: Container(
        child: Column(children: [
          FutureBuilder<ArticleDetail>(
              future: articleList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return (OngoingAppbar(
                    title: "FINISHED",
                    totalQty: snapshot.data!.totalQty,
                    picklist: snapshot.data!.picklist,
                    articleTotal: snapshot.data!.totalArticle,
                    duration: snapshot.data!.duration,
                  ));
                } else {
                  return (OngoingAppbar(
                    title: "FINISHED",
                    picklist: "",
                    totalQty: 0,
                    articleTotal: 0,
                    duration: "0",
                  ));
                }
              }),
          Expanded(
            child: FutureBuilder<ArticleDetail>(
              future: articleList,
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.articles.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () async {
                          print("dd");
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      height: 64,
                                      width: 64,
                                      decoration: const BoxDecoration(
                                          color: Color(0xFF84D9B1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)))),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 180,
                                        child: Text(
                                          "${snapshot.data!.articles[index].rackNumber}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Container(
                                        width: 180,
                                        child: Text(
                                          "${snapshot.data!.articles[index].articleName}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                          style: TextStyle(
                                              color: Color(0xFF2CBF6C),
                                              fontSize: 14),
                                        ),
                                      ),
                                      Text(
                                        "${snapshot.data!.articles[index].sizes} & ${snapshot.data!.articles[index].colourName}",
                                        style: TextStyle(
                                            color: Color(0xFF2CBF6C),
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                '${snapshot.data!.articles[index].qty}',
                                style: TextStyle(
                                    fontSize: 30,
                                    color:
                                        (snapshot.data!.articles[index].qty ??
                                                    0) >
                                                1
                                            ? Colors.redAccent
                                            : Colors.black,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
            ),
          ),
          Container(
              child: ElevatedButton(
                  child: const Text('Scan & Mark as Complete'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 40),
                    shadowColor: Colors.transparent,
                    primary: const Color(0xFF2CBF6C),
                    textStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  onPressed: () async {
                    scanBarcodeNormal();
                  }))
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => {Navigator.pop(context, index)},
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.stacked_bar_chart), label: "Ongoing"),
            BottomNavigationBarItem(
                icon: Icon(Icons.layers_rounded), label: "Queue"),
            BottomNavigationBarItem(
                icon: Icon(Icons.stacked_bar_chart), label: "Finished"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "My Account")
          ]),
    );
  }
}
