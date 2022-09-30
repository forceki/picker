import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:picker/components/ongoingappbar/ongoing_appbar.dart';

class QueueList extends StatefulWidget {
  const QueueList({Key? key}) : super(key: key);

  @override
  State<QueueList> createState() => _QueueListState();
}

class _QueueListState extends State<QueueList> {
  final _currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Logged in uus',
      //     style: TextStyle(fontSize: 16, color: Colors.black),
      //   ),
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.power_settings_new, color: Colors.black),
      //       onPressed: () {
      //         print("anu");
      //       },
      //     )
      //   ],
      // ),
      body: Container(
        child: Column(children: [
          OngoingAppbar(
            title: "Queue",
          ),
          Expanded(
              child: ListView.builder(
            itemCount: 6,
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
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(children: [
                          Container(
                              margin: const EdgeInsets.only(right: 16),
                              height: 64,
                              width: 64,
                              decoration: const BoxDecoration(
                                  color: Color(0xFF2CBF6C),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)))),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                child: Container(
                                  width: 220,
                                  child: const Text(
                                    "B-02-CA-04-B01",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Align(
                                child: Container(
                                  width: 220,
                                  child: const Text(
                                    "Article Name",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    style: TextStyle(
                                        color: Color(0xFF2CBF6C), fontSize: 14),
                                  ),
                                ),
                              ),
                              Align(
                                child: Container(
                                  child: const Text(
                                    "Size & Color",
                                    style: TextStyle(
                                        color: Color(0xFF2CBF6C), fontSize: 14),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]),
                        Container(
                          child: const Text(
                            '88',
                            style: TextStyle(
                                fontSize: 48,
                                color: Colors.black,
                                fontWeight: FontWeight.w300),
                          ),
                        )
                      ]),
                ),
              );
            }),
          ))
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
