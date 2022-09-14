import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:picker/components/ongoingappbar/ongoing_appbar.dart';

class OngoingDetail extends StatefulWidget {
  const OngoingDetail({Key? key}) : super(key: key);

  @override
  State<OngoingDetail> createState() => _OngoingDetailState();
}

class _OngoingDetailState extends State<OngoingDetail> {
  final int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Logged in uus',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.power_settings_new, color: Colors.black),
            onPressed: () {
              print("anu");
            },
          )
        ],
      ),
      body: Container(
        child: Column(children: [
          OngoingAppbar(
            title: "Ongoing",
          ),
          Expanded(
            child: ListView(children: [
              Container(
                  height: 380.0,
                  width: 380.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1611915387288-fd8d2f5f928b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80"),
                      fit: BoxFit.fitHeight,
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                        child: const Text(
                          'Location',
                          style: TextStyle(color: Color(0xFF84D9B1), fontSize: 12)
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: const Text(
                          'B-02-CA-04-B01',
                          style: TextStyle(color: Colors.black, fontSize: 24)
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: const Text(
                          'B-02-CA-04-B02',
                          style: TextStyle(color: Colors.black, fontSize: 24)
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: const Text(
                          'B-02-CA-04-B03',
                          style: TextStyle(color: Colors.black, fontSize: 24)
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: const Text(
                          'B-02-CA-04-B04',
                          style: TextStyle(color: Colors.black, fontSize: 24)
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 16, 16, 0),
                        child: const Text(
                          'Quantity',
                          style: TextStyle(color: Color(0xFF84D9B1), fontSize: 12)
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 16),
                        child: const Text(
                          '88',
                          style: TextStyle(color: Colors.black, fontSize: 60, fontWeight: FontWeight.w300)
                        ),
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
                    child: const Text(
                      'Article Name',
                      style: TextStyle(color: Color(0xFF84D9B1), fontSize: 12)
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 16),
                    width: 300,
                    child: const Text(
                      'HOODIE RED FLOWER MOTIV VERY LONG ARTICLE NAME',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(color: Colors.black, fontSize: 24)
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                    child: const Text(
                      'Size',
                      style: TextStyle(color: Color(0xFF84D9B1), fontSize: 12)
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 16),
                    child: const Text(
                      'XL',
                      style: TextStyle(color: Colors.black, fontSize: 24)
                    ),
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
                        child: const Text(
                          'article code',
                          style: TextStyle(color: Color(0xFF84D9B1), fontSize: 16, fontWeight: FontWeight.w300)
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: const Text(
                          'barcode',
                          style: TextStyle(color: Color(0xFF84D9B1), fontSize: 16, fontWeight: FontWeight.w300)
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: const Text(
                          'category',
                          style: TextStyle(color: Color(0xFF84D9B1), fontSize: 16, fontWeight: FontWeight.w300)
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: const Text(
                          'sub category',
                          style: TextStyle(color: Color(0xFF84D9B1), fontSize: 16, fontWeight: FontWeight.w300)
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: const Text(
                          'color',
                          style: TextStyle(color: Color(0xFF84D9B1), fontSize: 16, fontWeight: FontWeight.w300)
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: const Text(
                          'gender',
                          style: TextStyle(color: Color(0xFF84D9B1), fontSize: 16, fontWeight: FontWeight.w300)
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                        child: const Text(
                          'IN.BLC-UC007',
                          style: TextStyle(color: Colors.black, fontSize: 16)
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: const Text(
                          '00INUC0266',
                          style: TextStyle(color: Colors.black, fontSize: 16)
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: const Text(
                          'OUTER',
                          style: TextStyle(color: Colors.black, fontSize: 16)
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: const Text(
                          'HOODIE',
                          style: TextStyle(color: Colors.black, fontSize: 16)
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: const Text(
                          'RED',
                          style: TextStyle(color: Colors.black, fontSize: 16)
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: const Text(
                          'NON',
                          style: TextStyle(color: Colors.black, fontSize: 16)
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ]),
          ),
           Container(
                color: Colors.transparent,
                child: ElevatedButton(
                  child: Text('Scan & Mark as Complete'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 40),
                    primary: Color(0xFF2CBF6C),
                    textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  onPressed: () {
                    print('dd');
                  },
                )
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
