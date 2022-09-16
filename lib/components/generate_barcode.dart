import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrCode extends StatefulWidget {
  const GenerateQrCode({Key? key, required this.data}) : super(key: key);

  final String data;

  @override
  State<GenerateQrCode> createState() => _GenerateQrCodeState();
}

class _GenerateQrCodeState extends State<GenerateQrCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2CBF6C),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 104, 0, 9),
                child: Text(
                  'Success',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 34),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 54),
                child: Text(
                  'Handover to Packing Area',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
              QrImage(
                data: widget.data,
                version: QrVersions.auto,
                size: 182,
                backgroundColor: Colors.white,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 39, 0, 9),
                child: Text(
                  'Picklist Number',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 19),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 17),
                child: Text(
                  '20220804A010000001',
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          child: Text(
                        'Articles',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      )),
                      Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            '88/888',
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          )),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          child: Text(
                        'Quantity',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      )),
                      Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            '88/888',
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          )),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Started',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        '88:88:88',
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Duration',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        '88:88:88',
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
