import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
                // print('Delete ID: $_V1');
                // deleteTodo();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => edit3(_V1, _V2)));
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
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            // Card(
            //   child: ListTile(
            //     tileColor: Myconstat.white2,
            //     title: Row(
            //       children: [
            //         Text('${qrname3Controller.text}'),
            //         Spacer(),
            //         IconButton(
            //             onPressed: () {
            //               Navigator.pushReplacement(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (context) => edit3(_V1, _V2)));
            //             },
            //             icon: Icon(Icons.edit, color: Colors.black))
            //       ],
            //     ),
            //   ),
            // ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
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
                      Text('${namesw31Controller.text}'),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => name4edit(_V1, _V3)));
                          },
                          icon: Icon(Icons.edit, color: Colors.black))
                    ],
                  ),
                ),
              ),
            ),
            // FutureBuilder(
            //     future: getnamelist4(),
            //     builder: (context, AsyncSnapshot snapshot) => snapshot.hasData
            //         ? ListView.builder(
            //             padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
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
            //                         "${snapshot.data[index]['swname4']}",
            //                         style: Myconstat().h2Style(),
            //                       ),
            //                       Spacer(),
            //                       IconButton(
            //                           onPressed: () {
            //                             Navigator.push(
            //                               context,
            //                               MaterialPageRoute(
            //                                   builder: (context) => name4edit(
            //                                         snapshot.data[index]['id'],
            //                                         snapshot.data[index]
            //                                             ['swname4'],
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
              height: MediaQuery.of(context).size.height / 5,
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
                      Text('${namesw32Controller.text}'),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => name5edit(_V1, _V4)));
                          },
                          icon: Icon(Icons.edit, color: Colors.black))
                    ],
                  ),
                ),
              ),
            ),
            // FutureBuilder(
            //     future: getnamelist5(),
            //     builder: (context, AsyncSnapshot snapshot) => snapshot.hasData
            //         ? ListView.builder(
            //             padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
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
            //                         "${snapshot.data[index]['swname5']}",
            //                         style: Myconstat().h2Style(),
            //                       ),
            //                       Spacer(),
            //                       IconButton(
            //                           onPressed: () {
            //                             Navigator.push(
            //                               context,
            //                               MaterialPageRoute(
            //                                   builder: (context) => name5edit(
            //                                         snapshot.data[index]['id'],
            //                                         snapshot.data[index]
            //                                             ['swname5'],
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
              height: MediaQuery.of(context).size.height / 5,
              child: FirstSwitch('Dart/Mqtt_client/', 'led3'),
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
                      Text('${namesw33Controller.text}'),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => name6edit(_V1, _V5)));
                          },
                          icon: Icon(Icons.edit, color: Colors.black))
                    ],
                  ),
                ),
              ),
            ),
            // FutureBuilder(
            //     future: getnamelist6(),
            //     builder: (context, AsyncSnapshot snapshot) => snapshot.hasData
            //         ? ListView.builder(
            //             padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
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
            //                         "${snapshot.data[index]['swname6']}",
            //                         style: Myconstat().h2Style(),
            //                       ),
            //                       Spacer(),
            //                       IconButton(
            //                           onPressed: () {
            //                             Navigator.push(
            //                               context,
            //                               MaterialPageRoute(
            //                                   builder: (context) => name6edit(
            //                                         snapshot.data[index]['id'],
            //                                         snapshot.data[index]
            //                                             ['swname6'],
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
            //     controller: qrname3Controller,
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
            //       print('username: ${qrname3Controller.text}');
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
  //   var url = Uri.http('192.168.1.122:8000', '/api/update-devicelist3/$_V1');
  //   Map<String, String> header = {'Content-type': 'application/json'};
  //   String jsondata = '{"qrname3":"${qrname3Controller.text}"}';
  //   var response = await http.put(url, headers: header, body: jsondata);
  //   print('-------reuslt-------');
  //   print(response.body);
  // }

  Future deleteTodo() async {
    var url = Uri.http('192.168.1.122:8000', '/api/delete-devicelist3/$_V1');
    Map<String, String> header = {'Content-type': 'application/json'};
    var response = await http.delete(url, headers: header);
    print('-------reuslt-------');
    print(response.body);
  }

  Future<dynamic> getnamelist4() async {
    var url = Uri.http('192.168.1.122:8000', '/api/all-name4');
    var response = await http.get(url);
    var result = json.decode(utf8.decode(response.bodyBytes));
    print(result);
    return result;
  }

  Future<dynamic> getnamelist5() async {
    var url = Uri.http('192.168.1.122:8000', '/api/all-name5');
    var response = await http.get(url);
    var result = json.decode(utf8.decode(response.bodyBytes));
    print(result);
    return result;
  }

  Future<dynamic> getnamelist6() async {
    var url = Uri.http('192.168.1.122:8000', '/api/all-name6');
    var response = await http.get(url);
    var result = json.decode(utf8.decode(response.bodyBytes));
    print(result);
    return result;
  }
}
