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

  @override
  void initState() {
    articles = QueueAPI().getOngoing("picklist/ongoing");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FutureBuilder<ArticleDetail>(
              future: articles,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return (OngoingAppbar(
                    title: "Ongoing",
                    totalQty: snapshot.data!.totalQty,
                    picklist: snapshot.data!.picklist,
                    articleTotal: snapshot.data!.totalArticle,
                    duration: snapshot.data!.duration,
                  ));
                } else {
                  return (OngoingAppbar(
                    title: "Ongoing",
                    picklist: "",
                    totalQty: 0,
                    articleTotal: 0,
                    duration: "0",
                  ));
                }
              }),
          Expanded(
              child: FutureBuilder<ArticleDetail>(
            future: articles,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return (ListView.builder(
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
                                      articleTotal: snapshot.data!.totalArticle,
                                      duration: snapshot.data!.duration,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  color: (snapshot.data!.articles[index].qty ??
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
                ));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )),
          Container(
              child: ElevatedButton(
            child: const Text('Scan & Mark as Complete'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 40),
              shadowColor: Colors.transparent,
              textStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const GenerateQrCode(data: "uus ganteng")));
            },
          ))
        ],
      ),
    );
  }
}
