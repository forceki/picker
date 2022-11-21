import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/widgets.dart';
import 'package:picker/components/generate_barcode.dart';
import 'package:picker/components/ongoingappbar/ongoing_appbar.dart';
import 'package:picker/model/picklist.dart';
import 'package:picker/services/queue.dart';
import 'package:picker/view/pages/ongoing/ongoing_detail.dart';

class OnGoingPage extends StatefulWidget {
  const OnGoingPage({Key? key, required this.changeNavbar}) : super(key: key);

  final Function(int) changeNavbar;

  @override
  State<OnGoingPage> createState() => _OnGoingPageState();
}

class _OnGoingPageState extends State<OnGoingPage> {
  late Future<ArticleDetail> articles;
  TextEditingController noted = TextEditingController();

  @override
  void initState() {
    articles = QueueAPI().getOngoing("picklist/ongoing");
    super.initState();
  }

  void changeDate() {
    setState(() {
      articles = QueueAPI().getOngoing("picklist/ongoing");
    });
  }

  Widget getButton(status, picklist) {
    if (status) {
      return ElevatedButton(
        child: const Text('finished'),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(100, 40),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        onPressed: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GenerateQrCode(data: picklist)));
        },
      );
    } else {
      return ElevatedButton(
        child: const Text('finished'),
        style: ElevatedButton.styleFrom(
          primary: Colors.red[400],
          minimumSize: const Size(100, 40),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        onPressed: () async {
          final snackBar = SnackBar(
              content: const Text('Success !!'),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              duration: Duration(seconds: 1));

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      );
    }
  }

  _changeStatus(picklist) async {
    var data = {"status": "1", "picklist": picklist};
    print(data);
    var res = await QueueAPI().updateStatus("picklist", data);

    if (res['success'] == 1) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: const Text('Success !!'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${res['message']}'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder<ArticleDetail>(
      future: articles,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
              child: Stack(
            children: [
              Column(
                children: [
                  OngoingAppbar(
                      title: "Ongoing",
                      articleTotal: snapshot.data!.totalArticle,
                      picklist: snapshot.data!.picklist,
                      duration: snapshot.data!.duration,
                      totalPicked: snapshot.data!.totalPicked,
                      totalQty: snapshot.data!.totalQty),
                  Expanded(
                      child: ListView.builder(
                    itemCount: snapshot.data!.articles.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () async {
                          final result = await Navigator.push<int>(
                              context,
                              MaterialPageRoute(
                                  // navigasi ke detail page, tapi detail pagenya pakai template
                                  // scaffold kalo perlu bawa index bottomnavbar nya sekalian

                                  builder: (context) => OngoingDetail(
                                        data: snapshot.data!.articles[index],
                                        totalQty: snapshot.data!.totalQty,
                                        picklist: snapshot.data!.picklist,
                                        totalPicked: snapshot.data!.totalPicked,
                                        articleTotal:
                                            snapshot.data!.totalArticle,
                                        duration: snapshot.data!.duration,
                                      )));
                          // abis page tujuan di pop, bawa indexnya ke parent
                          // widget buat ngeganti body widget kalo user pencet
                          // bottomnavbarnya waktu di page detail
                          if (result is int) {
                            widget.changeNavbar(result);
                            changeDate();
                          }
                          ;
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
                                      decoration: BoxDecoration(
                                          color: snapshot.data!.articles[index]
                                                      .status_picked ==
                                                  true
                                              ? Color.fromARGB(
                                                  255, 164, 175, 170)
                                              : Color(0xFF84D9B1),
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
                                              color: snapshot
                                                          .data!
                                                          .articles[index]
                                                          .status_picked ==
                                                      true
                                                  ? Color.fromARGB(
                                                      255, 164, 175, 170)
                                                  : Colors.black,
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
                                              color: snapshot
                                                          .data!
                                                          .articles[index]
                                                          .status_picked ==
                                                      true
                                                  ? Color.fromARGB(
                                                      255, 164, 175, 170)
                                                  : Color(0xFF2CBF6C),
                                              fontSize: 14),
                                        ),
                                      ),
                                      Text(
                                        "${snapshot.data!.articles[index].sizes} & ${snapshot.data!.articles[index].colourName}",
                                        style: TextStyle(
                                            color: snapshot
                                                        .data!
                                                        .articles[index]
                                                        .status_picked ==
                                                    true
                                                ? Color.fromARGB(
                                                    255, 164, 175, 170)
                                                : Color(0xFF2CBF6C),
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
                                    color: snapshot.data!.articles[index]
                                                .status_picked ==
                                            true
                                        ? Color.fromARGB(255, 164, 175, 170)
                                        : (snapshot.data?.articles[index].qty ??
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
                  )),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: _buttonWidget(snapshot.data!.statusPicked,
                    snapshot.data!.totalQty, snapshot.data!.picklist),
              )
            ],
          ));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ));
  }

  _showModal(context, picklist) {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: 230,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10.0),
                topRight: const Radius.circular(10.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0, // has the effect of softening the shadow
                  spreadRadius: 0.0, // has the effect of extending the shadow
                )
              ],
            ),
            alignment: Alignment.topLeft,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 10),
                      child: Text(
                        "message",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Colors.black87),
                      ),
                    ),
                    Container(
                        child: FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.cancel_outlined,
                              color: Colors.grey,
                            ))),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                  child: TextField(
                    maxLines: 4,
                    controller: noted,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'noted',
                    ),
                  ),
                ),
                ElevatedButton(
                  child: const Text('submit'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    minimumSize: const Size(100, 40),
                    textStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  onPressed: () async {
                    _updateOngoing(picklist);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buttonWidget(status, qty, picklist) {
    if (qty > 0) {
      if (status == true) {
        return ElevatedButton(
            child: const Text('finished'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(100, 40),
              textStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            onPressed: () async {
              _changeStatus(picklist);

              final result = await Navigator.push<int>(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GenerateQrCode(data: picklist)));

              if (result is int) {
                widget.changeNavbar(result);
                changeDate();
              }
              ;
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => GenerateQrCode(
              //             data: snapshot.data!.picklist)));
            });
      } else {
        return ElevatedButton(
          child: const Text('finished'),
          style: ElevatedButton.styleFrom(
            primary: Colors.red[400],
            minimumSize: const Size(100, 40),
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          onPressed: () async {
            _showModal(context, picklist);
          },
        );
      }
    } else {
      return Visibility(
        visible: true,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(2),
              child: Text(
                "nothing ongoing picklist",
                style: TextStyle(fontSize: 16),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[400],
                minimumSize: const Size(80, 40),
                textStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: const Text('next'),
              onPressed: () async {
                widget.changeNavbar(2);
              },
            )
          ],
        )),
      );
    }
  }

  _updateOngoing(picklist) async {
    var body = {"picklist": picklist, "noted": noted.text};

    final res = await QueueAPI().updateStatusOngoing("picklist/ongoing", body);

    if (res['success'] == 1) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: const Text('Success !!'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3)));

      final result = await Navigator.push<int>(
          context,
          MaterialPageRoute(
              builder: (context) => GenerateQrCode(data: picklist)));

      if (result is int) {
        widget.changeNavbar(result);
        Navigator.pop(context);
      }
      ;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${res['message']}'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3)));
    }
  }
}
