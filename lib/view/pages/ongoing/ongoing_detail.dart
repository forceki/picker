import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:picker/components/generate_barcode.dart';
import 'package:picker/components/ongoingappbar/ongoing_appbar.dart';
import 'package:picker/model/picklist.dart';
import 'package:picker/view/pages/ongoing/ongoing_scan.dart';

class OngoingDetail extends StatefulWidget {
  const OngoingDetail(
      {Key? key,
      required this.data,
      required this.articleTotal,
      required this.picklist,
      required this.duration,
      required this.totalQty})
      : super(key: key);

  final Article data;
  final String picklist;
  final int articleTotal;
  final String duration;
  final int totalQty;

  @override
  State<OngoingDetail> createState() => _OngoingDetailState();
}

class _OngoingDetailState extends State<OngoingDetail> {
  final int _currentIndex = 1;
  String _scanBarcode = "nothing";
  List<String> raknumber = [];
  @override
  void initState() {
    super.initState();
    raknumber = widget.data.rackNumber.split('_');
    print(raknumber);
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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Column(children: [
          OngoingAppbar(
            title: "Ongoing",
            totalQty: widget.totalQty,
            picklist: widget.picklist,
            articleTotal: widget.articleTotal,
            duration: widget.duration,
          ),
          Expanded(
            child: ListView(children: [
              Stack(alignment: Alignment.topRight, children: <Widget>[
                const Image(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1611915387288-fd8d2f5f928b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80"),
                ),
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.clear_rounded),
                    padding: const EdgeInsets.all(21)),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                        child: const Text('Location',
                            style: TextStyle(
                                color: Color(0xFF2CBF6C), fontSize: 12)),
                      ),
                      for (var item in raknumber)
                        Container(
                          margin: const EdgeInsets.only(left: 16),
                          child: Text('${item}',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 22)),
                        ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 16, 16, 0),
                        child: const Text('Quantity',
                            style: TextStyle(
                                color: Color(0xFF2CBF6C), fontSize: 12)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 16),
                        child: Text('${widget.data.qty}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 45,
                                fontWeight: FontWeight.w300)),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                    child: const Text('Article Name',
                        style:
                            TextStyle(color: Color(0xFF2CBF6C), fontSize: 12)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 16),
                    width: 400,
                    child: Text('${widget.data.articleName}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: TextStyle(color: Colors.black, fontSize: 24)),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                    child: const Text('Size',
                        style:
                            TextStyle(color: Color(0xFF2CBF6C), fontSize: 12)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 16),
                    child: Text('${widget.data.sizes}',
                        style: TextStyle(color: Colors.black, fontSize: 24)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                        child: const Text('article code',
                            style: TextStyle(
                                color: Color(0xFF2CBF6C),
                                fontSize: 16,
                                fontWeight: FontWeight.w300)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: const Text('barcode',
                            style: TextStyle(
                                color: Color(0xFF2CBF6C),
                                fontSize: 16,
                                fontWeight: FontWeight.w300)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: const Text('category',
                            style: TextStyle(
                                color: Color(0xFF2CBF6C),
                                fontSize: 16,
                                fontWeight: FontWeight.w300)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: const Text('sub category',
                            style: TextStyle(
                                color: Color(0xFF2CBF6C),
                                fontSize: 16,
                                fontWeight: FontWeight.w300)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: const Text('color',
                            style: TextStyle(
                                color: Color(0xFF2CBF6C),
                                fontSize: 16,
                                fontWeight: FontWeight.w300)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: const Text('gender',
                            style: TextStyle(
                                color: Color(0xFF2CBF6C),
                                fontSize: 16,
                                fontWeight: FontWeight.w300)),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                        child: Text('${widget.data.articleCode}',
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: Text('${widget.data.barcode}',
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: Text('${widget.data.categoryName}',
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: Text('${widget.data.brandName}',
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: Text('${widget.data.colourName}',
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: Text('${widget.data.sex}',
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
                      ),
                    ],
                  )
                ],
              ),
            ]),
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
