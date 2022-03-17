import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test1/State/page/countdown-page.dart';
import 'package:test1/State/page/countdown-page2.dart';
import 'package:test1/State/sw.dart/name3-1edit.dart';
import 'package:test1/State/sw.dart/name3-2edit.dart';
import 'package:test1/State/sw.dart/name3-3edit.dart';
import 'package:test1/State/sw.dart/sw3edit.dart';
import 'dart:async';
import 'dart:convert';

import 'package:test1/State/swone.dart';
import 'package:test1/utility/my_constant.dart';

class Update3 extends StatefulWidget {
  final V1, V2, V3, V4, V5;
  const Update3(this.V1, this.V2, this.V3, this.V4, this.V5);

  @override
  _Update3State createState() => _Update3State();
}

class _Update3State extends State<Update3> {
  var _V1, _V2, _V3, _V4, _V5;
  TextEditingController qrname3Controller = TextEditingController();
  TextEditingController namesw31Controller = TextEditingController();
  TextEditingController namesw32Controller = TextEditingController();
  TextEditingController namesw33Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _V1 = widget.V1;
    _V2 = widget.V2;
    _V3 = widget.V3;
    _V4 = widget.V4;
    _V5 = widget.V5;
    qrname3Controller.text = _V2;
    namesw31Controller.text = _V3;
    namesw32Controller.text = _V4;
    namesw33Controller.text = _V5;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${qrname3Controller.text}'),
        backgroundColor: Myconstat.grey,
        shadowColor: Myconstat.primary1,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => edit3(_V1, _V2)));
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
              height: MediaQuery.of(context).size.height / 5,
              child: FirstSwitch(_V1, 'Dart/Mqtt_client/', 'led1'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Card(
                child: ListTile(
                  tileColor: Myconstat.white2,
                  title: Row(
                    children: [
                      Text('${namesw31Controller.text}'),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => name4edit(_V1, _V3)));
                          },
                          icon: Icon(Icons.edit, color: Colors.black)),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CountdownPage(
                                          'Dart/Mqtt_client/',
                                          'led1',
                                        )));
                          },
                          icon: Icon(Icons.timer, color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              child: FirstSwitch(_V1, 'Dart/Mqtt_client/', 'led2'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Card(
                child: ListTile(
                  tileColor: Myconstat.white2,
                  title: Row(
                    children: [
                      Text('${namesw32Controller.text}'),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => name5edit(_V1, _V4)));
                          },
                          icon: Icon(Icons.edit, color: Colors.black)),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CountdownPage(
                                          'Dart/Mqtt_client/',
                                          'led2',
                                        )));
                          },
                          icon: Icon(Icons.timer, color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              child: FirstSwitch(_V1, 'Dart/Mqtt_client/', 'led3'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Card(
                child: ListTile(
                  tileColor: Myconstat.white2,
                  title: Row(
                    children: [
                      Text('${namesw33Controller.text}'),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => name6edit(_V1, _V5)));
                          },
                          icon: Icon(Icons.edit, color: Colors.black)),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CountdownPage(
                                          'Dart/Mqtt_client/',
                                          'led3',
                                        )));
                          },
                          icon: Icon(Icons.timer, color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future deleteTodo() async {
    var url = Uri.http('192.168.1.120:8000', '/api/delete-devicelist3/$_V1');
    Map<String, String> header = {'Content-type': 'application/json'};
    var response = await http.delete(url, headers: header);
    print('-------reuslt-------');
    print(response.body);
  }
}
