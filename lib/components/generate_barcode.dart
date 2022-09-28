import 'dart:developer';
import 'dart:typed_data';

import 'package:epson_epos/epson_epos.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
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
  List<EpsonPrinterModel> printers = [];
  @override
  void initState() {
    super.initState();
    onDiscoveryTCP();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    if (!mounted) return;

    setState(() {});
  }

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
              Container(
                  margin: const EdgeInsets.all(10),
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      final printer = printers[index];
                      return ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text('${printer.model} | ${printer.series}'),
                        subtitle: Text('${printer.ipAddress}'),
                        trailing: ElevatedButton(
                            onPressed: () {
                              //onSetPrinterSetting(printer);
                              onPrintTest(printer);
                            },
                            style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent,
                              fixedSize: Size(105, 40),
                              primary: Color.fromARGB(255, 0, 166, 255),
                              textStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            child: Text('Print')),
                      );
                    },
                    itemCount: printers.length,
                    primary: false,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  buildPrinter() {}

  onDiscoveryTCP() async {
    try {
      List<EpsonPrinterModel>? data =
          await EpsonEPOS.onDiscovery(type: EpsonEPOSPortType.TCP);
      if (data != null && data.length > 0) {
        data.forEach((element) {
          print(element.toJson());
        });
        setState(() {
          printers = data;
        });
      }
    } catch (e) {
      log("Error: " + e.toString());
    }
  }

  Future<List<int>> _customEscPos() async {
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);
    List<int> bytes = [];

    bytes += generator.text('Success!',
        styles: const PosStyles(align: PosAlign.center));
    bytes += generator.feed(2);
    bytes +=
        generator.qrcode(widget.data, size: QRSize.Size4, cor: QRCorrection.H);
    bytes += generator.feed(2);

    bytes += generator.text('Picklist Number',
        styles: const PosStyles(align: PosAlign.center));

    bytes += generator.text('21300120983190201',
        styles: const PosStyles(align: PosAlign.center));

    bytes += generator.row([
      PosColumn(
        text: 'Articles',
        width: 6,
        styles: const PosStyles(align: PosAlign.center),
      ),
      PosColumn(
        text: 'Quantity',
        width: 6,
        styles: const PosStyles(align: PosAlign.center),
      ),
    ]);
    bytes += generator.row([
      PosColumn(
        text: '888',
        width: 6,
        styles: const PosStyles(align: PosAlign.center),
      ),
      PosColumn(
        text: '100',
        width: 6,
        styles: const PosStyles(align: PosAlign.center),
      ),
    ]);

    bytes += generator.text('Text size 200%',
        styles: const PosStyles(
            height: PosTextSize.size2,
            width: PosTextSize.size2,
            align: PosAlign.center));

    bytes += generator.reset();
    bytes += generator.cut();

    return bytes;
  }

  void onPrintTest(EpsonPrinterModel printer) async {
    EpsonEPOSCommand command = EpsonEPOSCommand();
    List<Map<String, dynamic>> commands = [];
    commands.add(command.addTextAlign(EpsonEPOSTextAlign.LEFT));
    commands.add(command.addFeedLine(4));
    commands.add(command.append('PRINT TEST OK!\n'));
    commands.add(command.rawData(Uint8List.fromList(await _customEscPos())));
    commands.add(command.addFeedLine(4));
    commands.add(command.addCut(EpsonEPOSCut.CUT_FEED));
    await EpsonEPOS.onPrint(printer, commands);
  }
}
