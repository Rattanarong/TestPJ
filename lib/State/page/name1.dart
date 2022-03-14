import 'package:flutter/material.dart';
import 'package:test1/State/mainpage.dart';
import 'package:test1/utility/my_constant.dart';
import 'package:test1/widgets/show_title.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class codename2 extends StatefulWidget {
  const codename2({Key? key}) : super(key: key);

  @override
  _codename2State createState() => _codename2State();
}

class _codename2State extends State<codename2> {
  final formKey = GlobalKey<FormState>();
  TextEditingController qrname2Controller = TextEditingController();
  TextEditingController namesw21Controller = TextEditingController();
  TextEditingController namesw22Controller = TextEditingController();

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
                buildTitle('NameDevice'),
                buildqrname(size),
                buildTitle('SwitchName'),
                buildnamesw1(size),
                buildnamesw2(size),
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
                        print('NameDevice: ${qrname2Controller.text}');
                        postname();
                        setState(() {
                          qrname2Controller.clear();
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
            controller: qrname2Controller,
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

  Row buildnamesw1(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 0),
          width: size * 0.6,
          child: TextFormField(
            controller: namesw21Controller,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก SwitchName1';
              }
            },
            decoration: InputDecoration(
              labelStyle: Myconstat().h3Style(),
              labelText: 'SwitchName1 :',
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

  Row buildnamesw2(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 15),
          width: size * 0.6,
          child: TextFormField(
            controller: namesw22Controller,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก SwitchName2';
              }
            },
            decoration: InputDecoration(
              labelStyle: Myconstat().h3Style(),
              labelText: 'SwitchName2 :',
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
    var url = Uri.http('192.168.1.146:8000', '/api/post-devicelist2/');
    Map<String, String> header = {'Content-type': 'application/json'};
    String jsondata =
        '{"qrname2":"${qrname2Controller.text}","namesw21":"${namesw21Controller.text}","namesw22":"${namesw22Controller.text}"}';
    var response = await http.post(url, headers: header, body: jsondata);
    print('-------reuslt-------');
    print(response.body);
    print(response.statusCode);
  }
}
