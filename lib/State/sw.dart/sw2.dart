import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test1/State/page/countdown-page.dart';
import 'package:test1/State/page/countdown-page1.dart';
import 'package:test1/State/sw.dart/name2-1edit.dart';
import 'package:test1/State/sw.dart/name2-2edit.dart';
import 'package:test1/State/sw.dart/sw2edit.dart';
import 'dart:async';
import 'dart:convert';

import 'package:test1/State/swone.dart';
import 'package:test1/utility/my_constant.dart';

class Update2 extends StatefulWidget {
  final V1, V2, V3, V4;
  const Update2(
    this.V1,
    this.V2,
    this.V3,
    this.V4,
  );

  @override
  _Update2State createState() => _Update2State();
}

class _Update2State extends State<Update2> {
  var _V1, _V2, _V3, _V4;
  TextEditingController qrname2Controller = TextEditingController();
  TextEditingController namesw21Controller = TextEditingController();
  TextEditingController namesw22Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _V1 = widget.V1;
    _V2 = widget.V2;
    _V3 = widget.V3;
    _V4 = widget.V4;
    qrname2Controller.text = _V2;
    namesw21Controller.text = _V3;
    namesw22Controller.text = _V4;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${qrname2Controller.text}'),
        backgroundColor: Myconstat.grey,
        shadowColor: Myconstat.primary1,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => edit2(_V1, _V2)));
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
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: FirstSwitch(_V1, 'Dart/Mqtt_client/', 'led1'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Card(
                child: ListTile(
                  tileColor: Myconstat.white2,
                  title: Row(
                    children: [
                      Text('${namesw21Controller.text}'),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => name2edit(_V1, _V3)));
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
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: FirstSwitch(_V1, 'Dart/Mqtt_client/', 'led2'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Card(
                child: ListTile(
                  tileColor: Myconstat.white2,
                  title: Row(
                    children: [
                      Text('${namesw22Controller.text}'),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => name3edit(_V1, _V4)));
                          },
                          icon: Icon(Icons.edit, color: Colors.black)),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CountdownPage(
                                        'Dart/Mqtt_client/', 'led2')));
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
    var url = Uri.http('192.168.1.120:8000', '/api/delete-devicelist2/$_V1');
    Map<String, String> header = {'Content-type': 'application/json'};
    var response = await http.delete(url, headers: header);
    print('-------reuslt-------');
    print(response.body);
  }

  Future<dynamic> getTodolist() async {
    var url = Uri.http('192.168.1.120:8000', '/api/all-devicelist2');
    var response = await http.get(url);
    var result = json.decode(utf8.decode(response.bodyBytes));
    print(result);
    return result;
  }
}
