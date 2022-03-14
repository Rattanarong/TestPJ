import 'package:flutter/material.dart';
import 'package:test1/State/mainpage.dart';
import 'package:test1/utility/my_constant.dart';
import 'package:test1/widgets/show_title.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class codename extends StatefulWidget {
  const codename({Key? key}) : super(key: key);

  @override
  _codenameState createState() => _codenameState();
}

class _codenameState extends State<codename> {
  final formKey = GlobalKey<FormState>();
  TextEditingController qrname1Controller = TextEditingController();
  TextEditingController namesw1Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting Name'),
        backgroundColor: Myconstat.primary,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildTitle('RoomName'),
                buildqrname(size),
                buildTitle('SwitchName'),
                buildnamesw(size),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Mainpage()));
                        print('data complete');
                        print('---------');
                        print('NameDevice: ${qrname1Controller.text}');
                        postname();
                        setState(() {
                          qrname1Controller.clear();
                        });
                      }
                    },
                    child: Text('OK'),
                    style: Myconstat().MyButtonStyle(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildqrname(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 0),
          width: size * 0.6,
          child: TextFormField(
            controller: qrname1Controller,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก RoomName';
              }
            },
            decoration: InputDecoration(
              labelStyle: Myconstat().h3Style(),
              labelText: 'RoomName :',
              prefixIcon: Icon(
                Icons.person,
                color: Myconstat.light2,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Myconstat.dark1),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Myconstat.light1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildnamesw(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 0),
          width: size * 0.6,
          child: TextFormField(
            controller: namesw1Controller,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก SwitchName';
              }
            },
            decoration: InputDecoration(
              labelStyle: Myconstat().h3Style(),
              labelText: 'SwitchName :',
              prefixIcon: Icon(
                Icons.person,
                color: Myconstat.light2,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Myconstat.dark1),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Myconstat.light1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container buildTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: ShowTitle(
        title: title,
        textStyle: Myconstat().h4Style(),
      ),
    );
  }

  Future postname() async {
    var url = Uri.http('192.168.1.146:8000', '/api/post-devicelist1/');
    Map<String, String> header = {'Content-type': 'application/json'};
    String jsondata =
        '{"qrname1":"${qrname1Controller.text}","namesw1":"${namesw1Controller.text}","stsw1":"false"}';
    var response = await http.post(url, headers: header, body: jsondata);
    print('-------reuslt-------');
    print(response.body);
    print(response.statusCode);
  }
}
