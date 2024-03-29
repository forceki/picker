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
      appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
              icon: Icon(Icons.adaptive.arrow_back_rounded),
              color: Colors.black,
              onPressed: () => Navigator.pop(context, 3)),
          backgroundColor: Colors.transparent,
          elevation: 0),
      backgroundColor: const Color(0xFF2CBF6C),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: const Text(
                  'Success',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 34),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 54),
                child: const Text(
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
                margin: const EdgeInsets.fromLTRB(0, 39, 0, 9),
                child: const Text(
                  'Picklist Number',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 19),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 17),
                child: Text(
                  '${widget.data}',
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Container(
              //             child: const Text(
              //           'Articles',
              //           style: TextStyle(
              //               color: Colors.black,
              //               fontSize: 16,
              //               fontWeight: FontWeight.w300),
              //         )),
              //         Container(
              //             margin: const EdgeInsets.only(bottom: 10),
              //             child: const Text(
              //               '88/888',
              //               style: TextStyle(color: Colors.black, fontSize: 25),
              //             )),
              //       ],
              //     ),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Container(
              //             child: const Text(
              //           'Quantity',
              //           style: TextStyle(
              //               color: Colors.black,
              //               fontSize: 16,
              //               fontWeight: FontWeight.w300),
              //         )),
              //         Container(
              //             margin: const EdgeInsets.only(bottom: 10),
              //             child: const Text(
              //               '88/888',
              //               style: TextStyle(color: Colors.black, fontSize: 25),
              //             )),
              //       ],
              //     )
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         const Text(
              //           'Started',
              //           style: TextStyle(
              //               color: Colors.black,
              //               fontSize: 16,
              //               fontWeight: FontWeight.w300),
              //         ),
              //         const Text(
              //           '88:88:88',
              //           style: TextStyle(color: Colors.black, fontSize: 25),
              //         ),
              //       ],
              //     ),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         const Text(
              //           'Duration',
              //           style: TextStyle(
              //               color: Colors.black,
              //               fontSize: 16,
              //               fontWeight: FontWeight.w300),
              //         ),
              //         const Text(
              //           '88:88:88',
              //           style: TextStyle(color: Colors.black, fontSize: 25),
              //         ),
              //       ],
              //     )
              //   ],
              // ),
              Container(
                  margin: const EdgeInsets.all(10),
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      final printer = printers[index];
                      return ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        title: Text('${printer.model} | ${printer.series}'),
                        subtitle: Text('${printer.ipAddress}'),
                        trailing: ElevatedButton(
                            onPressed: () {
                              //onSetPrinterSetting(printer);
                              onPrintTest(printer);
                            },
                            style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent,
                              fixedSize: const Size(105, 40),
                              primary: const Color.fromARGB(255, 0, 166, 255),
                              textStyle: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            child: const Text('Print')),
                      );
                    },
                    itemCount: printers.length,
                    primary: false,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
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

    bytes +=
        generator.qrcode(widget.data, size: QRSize.Size8, cor: QRCorrection.H);
    bytes += generator.feed(2);

    bytes += generator.text('Picklist Number',
        styles: const PosStyles(align: PosAlign.center));

    bytes += generator.text('${widget.data}',
        styles: const PosStyles(align: PosAlign.center));

    bytes += generator.cut();

    return bytes;
  }

  void onPrintTest(EpsonPrinterModel printer) async {
    EpsonEPOSCommand command = EpsonEPOSCommand();
    List<Map<String, dynamic>> commands = [];
    commands.add(command.addTextAlign(EpsonEPOSTextAlign.CENTER));
    commands.add(command.addFeedLine(1));
    commands.add(command.rawData(Uint8List.fromList(await _customEscPos())));
    commands.add(command.addCut(EpsonEPOSCut.CUT_RESERVE));
    await EpsonEPOS.onPrint(printer, commands);
  }
}
