import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test1/State/sw.dart/sw2.dart';
import 'package:test1/State/sw.dart/sw3.dart';
import 'dart:convert';
import 'dart:async';
import 'package:test1/State/update_todolist.dart';
import 'package:test1/utility/my_constant.dart';

class Get3 extends StatefulWidget {
  const Get3({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<Get3> {
  List todolistitems = [];
  String qrcode = 'Hi';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTodolist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Myconstat.grey1,
      body: todolistCreate(),
    );
  }

  Widget todolistCreate() {
    return ListView.builder(
        itemCount: todolistitems.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              tileColor: Myconstat.white2,
              title: Text("${todolistitems[index]['qrname']}"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Update3(
                          todolistitems[index]['id'],
                          todolistitems[index]['qrname'],
                          todolistitems[index]['password'])),
                ).then((value) => {
                      setState(() {
                        print(value);
                        if (value == 'delete') {
                          final snackBar = SnackBar(
                            content: const Text('ลบเรียบร้อยแล้ว'),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        getTodolist();
                      })
                    });
              },
            ),
          );
        });
  }

  Future<void> getTodolist() async {
    List alltodo = [];
    var url = Uri.http('192.168.10.106:8000', '/api/all-devicelist');
    var response = await http.get(url);
    // var result = json.decode(response.body);
    var result = utf8.decode(response.bodyBytes);
    print(result);
    setState(() {
      todolistitems = jsonDecode(result);
    });
  }
}
