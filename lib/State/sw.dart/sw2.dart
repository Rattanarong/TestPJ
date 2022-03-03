import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
                // print('Delete ID: $_V1');
                // deleteTodo();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => edit2(_V1, _V2)));
                // Navigator.pop(context, 'Setting');
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
            // Card(
            //   child: ListTile(
            //     tileColor: Myconstat.white2,
            //     title: Row(
            //       children: [
            //         Text('${qrname2Controller.text}'),
            //         Spacer(),
            //         IconButton(
            //             onPressed: () {
            //               Navigator.pushReplacement(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (context) => edit2(_V1, _V2)));
            //             },
            //             icon: Icon(Icons.edit, color: Colors.black))
            //       ],
            //     ),
            //   ),
            // ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: FirstSwitch('Dart/Mqtt_client/', 'led1'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Card(
                child: ListTile(
                  tileColor: Myconstat.white2,
                  title: Row(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      // )
                      Text('${namesw21Controller.text}'),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => name2edit(_V1, _V3)));
                          },
                          icon: Icon(Icons.edit, color: Colors.black))
                    ],
                  ),
                ),
              ),
            ),
            // FutureBuilder(
            //     future: getnamelist2(),
            //     builder: (context, AsyncSnapshot snapshot) => snapshot.hasData
            //         ? ListView.builder(
            //             padding: const EdgeInsets.fromLTRB(40, 5, 40, 10),
            //             shrinkWrap: true,
            //             primary: false,
            //             itemCount: snapshot.data!.length,
            //             itemBuilder: (BuildContext context, int index) {
            //               return Card(
            //                 child: ListTile(
            //                   tileColor: Myconstat.white2,
            //                   title: Row(
            //                     children: [
            //                       Text(
            //                         "${snapshot.data[index]['swname2']}",
            //                         style: Myconstat().h2Style(),
            //                       ),
            //                       Spacer(),
            //                       IconButton(
            //                           onPressed: () {
            //                             Navigator.push(
            //                               context,
            //                               MaterialPageRoute(
            //                                   builder: (context) => name2edit(
            //                                         snapshot.data[index]['id'],
            //                                         snapshot.data[index]
            //                                             ['swname2'],
            //                                       )),
            //                             ).then((value) => {
            //                                   setState(() {
            //                                     print(value);
            //                                     if (value == 'delete') {
            //                                       final snackBar = SnackBar(
            //                                         content: const Text(
            //                                             'ลบเรียบร้อยแล้ว'),
            //                                       );

            //                                       ScaffoldMessenger.of(context)
            //                                           .showSnackBar(snackBar);
            //                                     }
            //                                     // getTodolist();
            //                                   })
            //                                 });
            //                           },
            //                           icon:
            //                               Icon(Icons.edit, color: Colors.black))
            //                     ],
            //                   ),
            //                   // onTap: () {
            //                   //   Navigator.push(
            //                   //     context,
            //                   //     MaterialPageRoute(
            //                   //         builder: (context) => edit1(
            //                   //               snapshot.data[index]['id'],
            //                   //               snapshot.data[index]['qrname1'],
            //                   //             )),
            //                   //   ).then((value) => {
            //                   //         setState(() {
            //                   //           print(value);
            //                   //           if (value == 'delete') {
            //                   //             final snackBar = SnackBar(
            //                   //               content:
            //                   //                   const Text('ลบเรียบร้อยแล้ว'),
            //                   //             );

            //                   //             ScaffoldMessenger.of(context)
            //                   //                 .showSnackBar(snackBar);
            //                   //           }
            //                   //           getTodolist();
            //                   //         })
            //                   //       });
            //                   // },
            //                 ),
            //               );
            //             })
            //         : Container(
            //             // width: MediaQuery.of(context).size.width,
            //             // height: MediaQuery.of(context).size.height,
            //             // child: Center(
            //             //   child: CircularProgressIndicator(
            //             //     color: Colors.green,
            //             //   ),
            //             // ),
            //             )),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: FirstSwitch('Dart/Mqtt_client/', 'led2'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Card(
                child: ListTile(
                  tileColor: Myconstat.white2,
                  title: Row(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      // )
                      Text('${namesw22Controller.text}'),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => name3edit(_V1, _V4)));
                          },
                          icon: Icon(Icons.edit, color: Colors.black))
                    ],
                  ),
                ),
              ),
            ),
            // FutureBuilder(
            //     future: getnamelist3(),
            //     builder: (context, AsyncSnapshot snapshot) => snapshot.hasData
            //         ? ListView.builder(
            //             padding: const EdgeInsets.fromLTRB(40, 5, 40, 10),
            //             shrinkWrap: true,
            //             primary: false,
            //             itemCount: snapshot.data!.length,
            //             itemBuilder: (BuildContext context, int index) {
            //               return Card(
            //                 child: ListTile(
            //                   tileColor: Myconstat.white2,
            //                   title: Row(
            //                     children: [
            //                       Text(
            //                         "${snapshot.data[index]['swname3']}",
            //                         style: Myconstat().h2Style(),
            //                       ),
            //                       Spacer(),
            //                       IconButton(
            //                           onPressed: () {
            //                             Navigator.push(
            //                               context,
            //                               MaterialPageRoute(
            //                                   builder: (context) => name3edit(
            //                                         snapshot.data[index]['id'],
            //                                         snapshot.data[index]
            //                                             ['swname3'],
            //                                       )),
            //                             ).then((value) => {
            //                                   setState(() {
            //                                     print(value);
            //                                     if (value == 'delete') {
            //                                       final snackBar = SnackBar(
            //                                         content: const Text(
            //                                             'ลบเรียบร้อยแล้ว'),
            //                                       );

            //                                       ScaffoldMessenger.of(context)
            //                                           .showSnackBar(snackBar);
            //                                     }
            //                                     // getTodolist();
            //                                   })
            //                                 });
            //                           },
            //                           icon:
            //                               Icon(Icons.edit, color: Colors.black))
            //                     ],
            //                   ),
            //                   // onTap: () {
            //                   //   Navigator.push(
            //                   //     context,
            //                   //     MaterialPageRoute(
            //                   //         builder: (context) => edit1(
            //                   //               snapshot.data[index]['id'],
            //                   //               snapshot.data[index]['qrname1'],
            //                   //             )),
            //                   //   ).then((value) => {
            //                   //         setState(() {
            //                   //           print(value);
            //                   //           if (value == 'delete') {
            //                   //             final snackBar = SnackBar(
            //                   //               content:
            //                   //                   const Text('ลบเรียบร้อยแล้ว'),
            //                   //             );

            //                   //             ScaffoldMessenger.of(context)
            //                   //                 .showSnackBar(snackBar);
            //                   //           }
            //                   //           getTodolist();
            //                   //         })
            //                   //       });
            //                   // },
            //                 ),
            //               );
            //             })
            //         : Container(
            //             // width: MediaQuery.of(context).size.width,
            //             // height: MediaQuery.of(context).size.height,
            //             // child: Center(
            //             //   child: CircularProgressIndicator(
            //             //     color: Colors.green,
            //             //   ),
            //             // ),
            //             )),

            // TextField(
            //     controller: qrname2Controller,
            //     decoration: InputDecoration(
            //         labelText: 'Username', border: OutlineInputBorder())),
            // SizedBox(
            //   height: 30,
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: ElevatedButton(
            //     onPressed: () {
            //       print('---------------');
            //       print('username: ${qrname2Controller.text}');
            //       updateTodo();
            //       final snackBar = SnackBar(
            //         backgroundColor: Myconstat.broun,
            //         content: const Text('อัพเดทข้อมูลเรียบร้อยแล้ว'),
            //       );

            //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
            //       // setState(() {
            //       //   todo_title.clear();
            //       //   todo_detail.clear();
            //       // });
            //     },
            //     child: Text('ตกลง'),
            //     style: Myconstat().MyButtonStyle(),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  // Future updateTodo() async {
  //   var url = Uri.http('192.168.1.122:8000', '/api/update-devicelist2/$_V1');
  //   Map<String, String> header = {'Content-type': 'application/json'};
  //   String jsondata = '{"qrname2":"${qrname2Controller.text}"}';
  //   var response = await http.put(url, headers: header, body: jsondata);
  //   print('-------reuslt-------');
  //   print(response.body);
  // }

  Future deleteTodo() async {
    var url = Uri.http('192.168.1.122:8000', '/api/delete-devicelist2/$_V1');
    Map<String, String> header = {'Content-type': 'application/json'};
    var response = await http.delete(url, headers: header);
    print('-------reuslt-------');
    print(response.body);
  }

  Future<dynamic> getTodolist() async {
    var url = Uri.http('192.168.1.122:8000', '/api/all-devicelist2');
    var response = await http.get(url);
    var result = json.decode(utf8.decode(response.bodyBytes));
    print(result);
    return result;
  }

  Future<dynamic> getnamelist2() async {
    var url = Uri.http('192.168.1.122:8000', '/api/all-name2');
    var response = await http.get(url);
    var result = json.decode(utf8.decode(response.bodyBytes));
    print(result);
    return result;
  }

  Future<dynamic> getnamelist3() async {
    var url = Uri.http('192.168.1.122:8000', '/api/all-name3');
    var response = await http.get(url);
    var result = json.decode(utf8.decode(response.bodyBytes));
    print(result);
    return result;
  }
}
