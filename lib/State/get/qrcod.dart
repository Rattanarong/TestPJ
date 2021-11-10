import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:async';
import 'package:test1/utility/my_constant.dart';

class Qrcode extends StatefulWidget {
  const Qrcode({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<Qrcode> {
  List todolistitems = [];
  String qrcode = 'Hi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildqrcode(),
    );
  }

  Padding buildqrcode() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Myconstat.black,
          onPressed: startscan,
          child: Icon(
            Icons.qr_code_scanner_sharp,
            color: Myconstat.primary1,
          ),
        ),
      ),
    );
  }

  Future<void> startscan() async {
    try {
      final qrcode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.qrcode = qrcode;
      });
    } on PlatformException {
      qrcode = 'Failed to get platform version.';
    }
  }
}
