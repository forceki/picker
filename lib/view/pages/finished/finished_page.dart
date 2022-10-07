import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:picker/view/pages/finished/fineshed_list.dart';

class FinishedPage extends StatefulWidget {
  const FinishedPage({Key? key, required this.changeNavbar}) : super(key: key);
  final Function(int) changeNavbar;
  @override
  State<FinishedPage> createState() => FinishedPageState();
}

class FinishedPageState extends State<FinishedPage> {
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                          builder: (context) => const FinishedList()));
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "20220804A010000001",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Art 88",
                              style: TextStyle(
                                  color: Color(0xFF2CBF6C), fontSize: 14),
                            ),
                            Text(
                              "Qty 888",
                              style: TextStyle(
                                  color: Color(0xFF2CBF6C), fontSize: 14),
                            ),
                            Text(
                              "Received 88:88:88",
                              style: TextStyle(
                                  color: Color(0xFF2CBF6C), fontSize: 14),
                            )
                          ],
                        ),
                        const Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.black,
                          size: 24.0,
                          semanticLabel: 'Continue',
                        ),
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
