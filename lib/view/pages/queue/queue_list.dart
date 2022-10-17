import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:picker/components/ongoingappbar/ongoing_appbar.dart';
import 'package:picker/model/picklist.dart';
import 'package:picker/services/queue.dart';

class QueueList extends StatefulWidget {
  const QueueList({Key? key, required this.orderNumber}) : super(key: key);

  final orderNumber;

  @override
  State<QueueList> createState() => _QueueListState();
}

class _QueueListState extends State<QueueList> {
  final _currentIndex = 2;
  late Future<ArticleDetail> articleList;

  @override
  void initState() {
    articleList = QueueAPI().getArticle('picklist/detail', widget.orderNumber);
    super.initState();
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
                    title: "QUEUE",
                    totalQty: snapshot.data!.totalQty,
                    picklist: snapshot.data!.picklist,
                    articleTotal: snapshot.data!.totalArticle,
                    duration: snapshot.data!.duration,
                  ));
                } else {
                  return (OngoingAppbar(
                    title: "QUEUE",
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
          )
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
