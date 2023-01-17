import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class NavbarApps extends StatelessWidget {
  const NavbarApps(
      {Key? key,
      required this.title,
      required this.articleTotal,
      required this.totalPicklist,
      required this.totalQty})
      : super(key: key);

  final String title;
  final int articleTotal;
  final int totalQty;
  final int totalPicklist;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: Text(
              '${title}',
              style: TextStyle(color: Color(0xFF2CBF6C), fontSize: 34),
            )),
        Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
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
                        "${totalPicklist}",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
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
                        '${articleTotal}',
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
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
                        '${totalQty}',
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    )
                  ],
                ),
              ],
            ))
      ],
    ));
  }
}
