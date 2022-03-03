import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test1/State/mainpage.dart';
import 'dart:async';
import 'dart:convert';

import 'package:test1/State/swone.dart';
import 'package:test1/utility/my_constant.dart';

class edit1 extends StatefulWidget {
  final V1, V2;
  const edit1(
    this.V1,
    this.V2,
  );

  @override
  _edit1State createState() => _edit1State();
}

class _edit1State extends State<edit1> {
  var _V1, _V2;
  TextEditingController qrname1Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _V1 = widget.V1;
    _V2 = widget.V2;
    qrname1Controller.text = _V2;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting Room'),
        backgroundColor: Myconstat.grey,
        shadowColor: Myconstat.primary1,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 100, 40, 0),
        child: ListView(
          children: <Widget>[
            TextField(
                controller: qrname1Controller,
                decoration: InputDecoration(
                    labelText: 'RoomName', border: OutlineInputBorder())),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  print('---------------');
                  print('username: ${qrname1Controller.text}');
                  updateTodo();
                  final snackBar = SnackBar(
                    backgroundColor: Myconstat.broun,
                    content: const Text('อัพเดทข้อมูลเรียบร้อยแล้ว'),
                  );
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Mainpage()));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  // setState(() {
                  //   todo_title.clear();
                  //   todo_detail.clear();
                  // });
                },
                child: Text('ตกลง'),
                style: Myconstat().MyButtonStyle(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future updateTodo() async {
    var url = Uri.http('192.168.1.122:8000', '/api/update-devicelist1/$_V1');
    Map<String, String> header = {'Content-type': 'application/json'};
    String jsondata = '{"qrname1":"${qrname1Controller.text}"}';
    var response = await http.put(url, headers: header, body: jsondata);
    print('-------reuslt-------');
    print(response.body);
  }
}
