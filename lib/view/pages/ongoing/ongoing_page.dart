import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:picker/components/ongoingappbar/ongoing_appbar.dart';
import 'package:picker/view/pages/ongoing/ongoing_detail.dart';

class OnGoingPage extends StatefulWidget {
  const OnGoingPage({Key? key, required this.changeNavbar}) : super(key: key);

  final Function(int) changeNavbar;

  @override
  State<OnGoingPage> createState() => _OnGoingPageState();
}

class _OnGoingPageState extends State<OnGoingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          OngoingAppbar(),
          Expanded(
              child: ListView.builder(
            itemCount: 6,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () async {
                  final result = await Navigator.push<int>(
                      context,
                      MaterialPageRoute(
                          // navigasi ke detail page, tapi detail pagenya pakai template
                          // scaffold kalo perlu bawa index bottomnavbar nya sekalian

                          builder: (context) => OngoingDetail()));
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
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 64, width: 64, color: Color(0xFF84D9B1)),
                        Column(
                          children: [
                            Flexible(
                              //alignment: Alignment.centerLeft,
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                text: const TextSpan(
                                  text: "B-02-CA-04-B01, B-02-CA-03-B02",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: const Text(
                                  "Article Name",
                                  style: TextStyle(
                                      color: Color(0xFF2CBF6C), fontSize: 14),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                child: const Text(
                                  "Size & Color",
                                  style: TextStyle(
                                      color: Color(0xFF2CBF6C), fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                            child: const Text(
                          '88',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 48,
                              fontWeight: FontWeight.w300),
                        )),
                      ]),
                ),
              );
            }),
          ))
        ],
      ),
    );
  }
}
