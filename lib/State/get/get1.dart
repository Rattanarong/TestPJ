import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test1/State/sw.dart/sw1.dart';
import 'package:test1/State/sw.dart/sw2.dart';
import 'package:test1/State/sw.dart/sw3.dart';
import 'dart:convert';
import 'dart:async';
import 'package:test1/utility/my_constant.dart';

class Get1 extends StatefulWidget {
  const Get1({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<Get1> {
  List todolistitems = [];
  List todolistitems2 = [];
  List todolistitems3 = [];
  String qrcode = 'Hi';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Myconstat.grey1,
      body: todolistCreate(),
    );
  }

  Widget todolistCreate() {
    return Column(
      children: [
        FutureBuilder(
            future: getTodolist(),
            builder: (context, AsyncSnapshot snapshot) => snapshot.hasData
                ? ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          tileColor: Myconstat.white2,
                          title: Row(
                            children: [
                              Text(
                                "${snapshot.data[index]['qrname1']}",
                                style: Myconstat().h2Style(),
                              ),
                              Spacer(),
                              Text('1 '),
                              Icon(Icons.light),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Update1(
                                        snapshot.data[index]['id'],
                                        snapshot.data[index]['qrname1'],
                                        snapshot.data[index]['namesw1'],
                                      )),
                            ).then((value) => {
                                  setState(() {
                                    print(value);
                                    if (value == 'delete') {
                                      final snackBar = SnackBar(
                                        content: const Text('ลบเรียบร้อยแล้ว'),
                                      );

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                    getTodolist();
                                  })
                                });
                          },
                        ),
                      );
                    })
                : Container()),
        FutureBuilder(
            future: getTodolist2(),
            builder: (context, AsyncSnapshot snapshot) => snapshot.hasData
                ? Container(
                    child: Column(children: [
                    ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: ListTile(
                              tileColor: Myconstat.white2,
                              title: Row(
                                children: [
                                  Text(
                                    "${snapshot.data[index]['qrname2']}",
                                    style: Myconstat().h2Style(),
                                  ),
                                  Spacer(),
                                  Text('2 '),
                                  Icon(
                                    Icons.light,
                                    color: Myconstat.black,
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Update2(
                                            snapshot.data[index]['id'],
                                            snapshot.data[index]['qrname2'],
                                            snapshot.data[index]['namesw21'],
                                            snapshot.data[index]['namesw22'],
                                          )),
                                ).then((value) => {
                                      setState(() {
                                        print(value);
                                        if (value == 'delete') {
                                          final snackBar = SnackBar(
                                            content:
                                                const Text('ลบเรียบร้อยแล้ว'),
                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                        getTodolist2();
                                      })
                                    });
                              },
                            ),
                          );
                        }),
                  ]))
                : Container()),
        FutureBuilder(
          future: getTodolist3(),
          builder: (context, AsyncSnapshot snapshot) => snapshot.hasData
              ? Container(
                  child: Column(children: [
                  ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            tileColor: Myconstat.white2,
                            title: Row(
                              children: [
                                Text(
                                  "${snapshot.data[index]['qrname3']}",
                                  style: Myconstat().h2Style(),
                                ),
                                Spacer(),
                                Text('3 '),
                                Icon(
                                  Icons.light,
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Update3(
                                          snapshot.data[index]['id'],
                                          snapshot.data[index]['qrname3'],
                                          snapshot.data[index]['namesw31'],
                                          snapshot.data[index]['namesw32'],
                                          snapshot.data[index]['namesw33'],
                                        )),
                              ).then((value) => {
                                    setState(() {
                                      print(value);
                                      if (value == 'delete') {
                                        final snackBar = SnackBar(
                                          content:
                                              const Text('ลบเรียบร้อยแล้ว'),
                                        );

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                      getTodolist3();
                                    })
                                  });
                            },
                          ),
                        );
                      }),
                ]))
              : Container(),
        )
      ],
    );
  }

  Future<dynamic> getTodolist() async {
    var url = Uri.http('192.168.1.120:8000', '/api/all-devicelist1');
    var response = await http.get(url);
    var result = json.decode(utf8.decode(response.bodyBytes));
    print(result);
    return result;
  }

  Future<dynamic> getTodolist2() async {
    var url = Uri.http('192.168.1.120:8000', '/api/all-devicelist2');
    var response = await http.get(url);
    var result = json.decode(utf8.decode(response.bodyBytes));
    print(result);
    return result;
  }

  Future<dynamic> getTodolist3() async {
    var url = Uri.http('192.168.1.120:8000', '/api/all-devicelist3');
    var response = await http.get(url);
    var result = json.decode(utf8.decode(response.bodyBytes));
    print(result);
    return result;
  }
}
