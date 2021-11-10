import 'package:flutter/material.dart';
// import 'package:qrscan/qrscan.dart' as scanner;
import 'package:test1/State/get/get.dart';
import 'package:test1/State/get/qrcod.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:test1/utility/my_constant.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class AddPage1 extends StatefulWidget {
  const AddPage1({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage1> {
  List todolistitems = [];
  String qrcode = 'Hi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Myconstat.black,
        onPressed: startscan,
        child: Icon(
          Icons.qr_code_scanner_sharp,
          color: Myconstat.primary1,
        ),
      ),
      body: Getdata(),
    );
  }

  // Widget todolistCreate() {
  //   return ListView.builder(
  //       itemCount: todolistitems.length,
  //       itemBuilder: (context, index) {
  //         return Card(
  //           child: ListTile(
  //             title: Text("${todolistitems[index]['username']}"),
  //             onTap: () {
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                     builder: (context) => UpdatePage(
  //                         todolistitems[index]['id'],
  //                         todolistitems[index]['username'],
  //                         todolistitems[index]['password'])),
  //               ).then((value) => {
  //                     setState(() {
  //                       print(value);
  //                       if (value == 'delete') {
  //                         final snackBar = SnackBar(
  //                           content: const Text('ลบเรียบร้อยแล้ว'),
  //                         );

  //                         ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //                       }
  //                       getTodolist();
  //                     })
  //                   });
  //             },
  //           ),
  //         );
  //       });
  // }

  // Padding buildqrcode() {
  //   return Padding(
  //     padding: const EdgeInsets.all(5),
  //     child: Scaffold(
  //       floatingActionButton: FloatingActionButton(
  //         backgroundColor: Myconstat.black,
  //         onPressed: startscan,
  //         child: Icon(
  //           Icons.qr_code_scanner_sharp,
  //           color: Myconstat.primary1,
  //         ),
  //       ),
  //     ),
  //   );
  // }

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

  // AppBar buildname() {
  //   return AppBar(
  //     actions: [
  //       IconButton(
  //         onPressed: () {
  //           setState(() {
  //             getTodolist();
  //           });
  //         },
  //         icon: Icon(Icons.refresh_outlined),
  //       )
  //     ],
  //   );
  // }

  // Future<void> getTodolist() async {
  //   List alltodo = [];
  //   var url = Uri.http('192.168.1.117:8000', '/api/all-newlist');
  //   var response = await http.get(url);
  //   // var result = json.decode(response.body);
  //   var result = utf8.decode(response.bodyBytes);
  //   print(result);
  //   setState(() {
  //     todolistitems = jsonDecode(result);
  //   });
  // }
}
