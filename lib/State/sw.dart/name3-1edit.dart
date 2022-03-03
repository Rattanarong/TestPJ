import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test1/State/mainpage.dart';
import 'dart:async';
import 'dart:convert';

import 'package:test1/State/swone.dart';
import 'package:test1/utility/my_constant.dart';

class name4edit extends StatefulWidget {
  final V1, V2;
  const name4edit(
    this.V1,
    this.V2,
  );

  @override
  _name4editState createState() => _name4editState();
}

class _name4editState extends State<name4edit> {
  var _V1, _V2;
  TextEditingController namesw31Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _V1 = widget.V1;
    _V2 = widget.V2;
    namesw31Controller.text = _V2;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แก้ไขข้อมูล'),
        backgroundColor: Myconstat.grey,
        shadowColor: Myconstat.primary1,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 100, 40, 0),
        child: ListView(
          children: <Widget>[
            TextField(
                controller: namesw31Controller,
                decoration: InputDecoration(
                    labelText: 'Username', border: OutlineInputBorder())),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  print('---------------');
                  print('username: ${namesw31Controller.text}');
                  updateTodo();
                  final snackBar = SnackBar(
                    backgroundColor: Myconstat.broun,
                    content: const Text('อัพเดทข้อมูลเรียบร้อยแล้ว'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Mainpage()));
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
    var url = Uri.http('192.168.1.122:8000', '/api/update-devicelist3/$_V1');
    Map<String, String> header = {'Content-type': 'application/json'};
    String jsondata = '{"namesw31":"${namesw31Controller.text}"}';
    var response = await http.put(url, headers: header, body: jsondata);
    print('-------reuslt-------');
    print(response.body);
  }
}
