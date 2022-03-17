import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test1/State/page/countdown-page.dart';
import 'package:test1/State/sw.dart/name1edit.dart';
import 'package:test1/State/sw.dart/sw1edit.dart';
import 'dart:async';
import 'dart:convert';

import 'package:test1/State/swone.dart';
import 'package:test1/utility/my_constant.dart';

class Update1 extends StatefulWidget {
  final V1, V2, V3;
  const Update1(
    this.V1,
    this.V2,
    this.V3,
  );

  @override
  _Update1State createState() => _Update1State();
}

class _Update1State extends State<Update1> {
  var _V1, _V2, _V3;
  TextEditingController qrname1Controller = TextEditingController();
  TextEditingController namesw1Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _V1 = widget.V1;
    _V2 = widget.V2;
    _V3 = widget.V3;
    qrname1Controller.text = _V2;
    namesw1Controller.text = _V3;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${qrname1Controller.text}'),
        backgroundColor: Myconstat.grey,
        shadowColor: Myconstat.primary1,
        actions: [
          IconButton(
              splashColor: Myconstat.blue,
              highlightColor: Myconstat.blue,
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => edit1(_V1, _V2)));
              },
              icon: Icon(
                Icons.edit,
                color: Colors.yellow,
              )),
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
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: FirstSwitch(_V1, 'Dart/Mqtt_client/', 'led1'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Card(
                child: ListTile(
                  tileColor: Myconstat.white2,
                  title: Row(
                    children: [
                      Text('${namesw1Controller.text}'),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => name1edit(_V1, _V3)));
                          },
                          icon: Icon(Icons.edit, color: Colors.black)),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CountdownPage(
                                        'Dart/Mqtt_client/', 'led1')));
                          },
                          icon: Icon(Icons.timer, color: Colors.black)),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future deleteTodo() async {
    var url = Uri.http('192.168.1.120:8000', '/api/delete-devicelist1/$_V1');
    Map<String, String> header = {'Content-type': 'application/json'};
    var response = await http.delete(url, headers: header);
    print('-------reuslt-------');
    print(response.body);
  }

  Future<dynamic> getTodolist() async {
    var url = Uri.http('192.168.1.120:8000', '/api/all-devicelist1');
    var response = await http.get(url);
    var result = json.decode(utf8.decode(response.bodyBytes));
    print(result);
    return result;
  }
}
