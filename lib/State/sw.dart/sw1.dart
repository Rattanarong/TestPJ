import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
                // print('Delete ID: $_V1');
                // deleteTodo();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => edit1(_V1, _V2)));
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
            //         Text('${qrname1Controller.text}'),
            //         Spacer(),
            //         IconButton(
            //             onPressed: () {
            //               Navigator.pushReplacement(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (context) => edit1(_V1, _V2)));
            //             },
            //             icon: Icon(Icons.edit, color: Colors.black))
            //       ],
            //     ),
            //   ),
            // ),
            // FutureBuilder(
            //     future: getTodolist(),
            //     builder: (context, AsyncSnapshot snapshot) => snapshot.hasData
            //         ? ListView.builder(
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
            //                         "${qrname1Controller.text}",
            //                         style: Myconstat().h2Style(),
            //                       ),
            //                       Spacer(),
            //                       IconButton(
            //                           onPressed: () {
            //                             Navigator.push(
            //                               context,
            //                               MaterialPageRoute(
            //                                   builder: (context) => edit1(
            //                                         snapshot.data[index]['id'],
            //                                         snapshot.data[index]
            //                                             ['qrname1'],
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
            //                 ),
            //               );
            //             })
            //         : Container(
            //             // ),
            //             )),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
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
                      Text('${namesw1Controller.text}'),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => name1edit(_V1, _V3)));
                          },
                          icon: Icon(Icons.edit, color: Colors.black))
                    ],
                  ),
                ),
              ),
            )
            // FutureBuilder(
            //     future: getnamelist(),
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
            //                         "${snapshot.data[index]['swname1']}",
            //                         style: Myconstat().h2Style(),
            //                       ),
            //                       Spacer(),
            //                       IconButton(
            //                           onPressed: () {
            //                             Navigator.push(
            //                               context,
            //                               MaterialPageRoute(
            //                                   builder: (context) => name1edit(
            //                                         snapshot.data[index]['id'],
            //                                         snapshot.data[index]
            //                                             ['swname1'],
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
            //                             // Navigator.push(context,
            //                             //     MaterialPageRoute(builder: (context) {
            //                             //   return edit1(('id'), ('qrname1'));
            //                             // }));
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
            //     controller: qrname1Controller,
            //     decoration: InputDecoration(
            //         labelText: 'Username', border: OutlineInputBorder())),
            // SizedBox(height: 30),
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: ElevatedButton(
            //     onPressed: () {
            //       print('---------------');
            //       print('username: ${qrname1Controller.text}');
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
  //   var url = Uri.http('192.168.1.122:8000', '/api/update-devicelist1/$_V1');
  //   Map<String, String> header = {'Content-type': 'application/json'};
  //   String jsondata = '{"qrname1":"${qrname1Controller.text}"}';
  //   var response = await http.put(url, headers: header, body: jsondata);
  //   print('-------reuslt-------');
  //   print(response.body);
  // }

  Future deleteTodo() async {
    var url = Uri.http('192.168.1.122:8000', '/api/delete-devicelist1/$_V1');
    Map<String, String> header = {'Content-type': 'application/json'};
    var response = await http.delete(url, headers: header);
    print('-------reuslt-------');
    print(response.body);
  }

  Future<dynamic> getTodolist() async {
    var url = Uri.http('192.168.1.122:8000', '/api/all-devicelist1');
    var response = await http.get(url);
    var result = json.decode(utf8.decode(response.bodyBytes));
    print(result);
    return result;
  }

  Future<dynamic> getnamelist() async {
    var url = Uri.http('192.168.1.122:8000', '/api/all-name1');
    var response = await http.get(url);
    var result = json.decode(utf8.decode(response.bodyBytes));
    print(result);
    return result;
  }
}
