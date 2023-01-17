import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:picker/components/chart.dart';

class OngoingAppbar extends StatelessWidget {
  const OngoingAppbar(
      {Key? key,
      required this.title,
      required this.articleTotal,
      required this.picklist,
      required this.duration,
      required this.totalPicked,
      required this.totalQty})
      : super(key: key);

  final String title;
  final String picklist;
  final int totalPicked;
  final int articleTotal;
  final String duration;
  final int totalQty;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    child: Container(
                      child: Text(
                        "$title",
                        style: const TextStyle(
                            color: Color(0xFF2CBF6C), fontSize: 22),
                      ),
                    ),
                  ),
                  Align(
                    child: Container(
                      child: Text(
                        "$picklist",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   width: 100,
            //   height: 100,
            //   child: const ChartWidget(),
            // )
          ],
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 12, 16, 36),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                //margin: const EdgeInsets.all(1.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: const Text(
                          "Articles",
                          style:
                              TextStyle(color: Color(0xFF2CBF6C), fontSize: 16),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Text(
                          "$totalPicked/$articleTotal",
                          style: TextStyle(color: Colors.black, fontSize: 24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //margin: const EdgeInsets.all(1.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: const Text(
                          "Quantity",
                          style:
                              TextStyle(color: Color(0xFF2CBF6C), fontSize: 16),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Text(
                          "$totalQty",
                          style: TextStyle(color: Colors.black, fontSize: 24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //margin: const EdgeInsets.all(1.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: const Text(
                          "Duration",
                          style:
                              TextStyle(color: Color(0xFF2CBF6C), fontSize: 16),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Text(
                          "$duration",
                          style: TextStyle(color: Colors.black, fontSize: 24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
