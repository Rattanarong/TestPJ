import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:test1/State/swone.dart';
import 'package:test1/utility/my_constant.dart';

class Update1 extends StatefulWidget {
  final V1, V2, V3;
  const Update1(this.V1, this.V2, this.V3);

  @override
  _Update1State createState() => _Update1State();
}

class _Update1State extends State<Update1> {
  var _V1, _V2, _V3;
  TextEditingController qrname1Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _V1 = widget.V1;
    _V2 = widget.V2;
    _V3 = widget.V3;
    qrname1Controller.text = _V2;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แก้ไขข้อมูล'),
        backgroundColor: Myconstat.grey,
        shadowColor: Myconstat.primary1,
        actions: [
          IconButton(
              onPressed: () {
                print('Delete ID: $_V1');
                deleteTodo();
                Navigator.pop(context, 'delete');
              },
              icon: Icon(
                Icons.delete,
                color: Colors.yellow,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              child: FirstSwitch('Dart/Mqtt_client/', 'led1'),
            ),
            TextField(
                controller: qrname1Controller,
                decoration: InputDecoration(
                    labelText: 'Username', border: OutlineInputBorder())),
            SizedBox(
              height: 30,
            ),
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
    var url = Uri.http('192.168.10.106:8000', '/api/update-devicelist/$_V1');
    Map<String, String> header = {'Content-type': 'application/json'};
    String jsondata = '{"qrname1":"${qrname1Controller.text}"}';
    var response = await http.put(url, headers: header, body: jsondata);
    print('-------reuslt-------');
    print(response.body);
  }

  Future deleteTodo() async {
    var url = Uri.http('192.168.10.106:8000', '/api/delete-devicelist/$_V1');
    Map<String, String> header = {'Content-type': 'application/json'};
    var response = await http.delete(url, headers: header);
    print('-------reuslt-------');
    print(response.body);
  }
}
