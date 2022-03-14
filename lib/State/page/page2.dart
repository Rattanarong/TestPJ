import 'package:flutter/material.dart';
import 'package:test1/State/login.dart';
import 'package:test1/State/page/countdown-page.dart';
import 'package:test1/utility/my_constant.dart';

class options extends StatefulWidget {
  const options({Key? key}) : super(key: key);

  @override
  _optionsState createState() => _optionsState();
}

class _optionsState extends State<options> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Myconstat.grey1,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CountdownPage(
                              'Dart/Mqtt_client/', 'led1', 'led2', 'led3')));
                  print('options');
                },
                child: Text('Timer', style: Myconstat().h7Style()),
                style: Myconstat().MyButtonStyle1(),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()));
                    print('Logout');
                  },
                  child: Text('Logout', style: Myconstat().h7Style()),
                  style: Myconstat().MyButtonStyle1(),
                ))
          ],
        ),
      ),
    );
  }
}
