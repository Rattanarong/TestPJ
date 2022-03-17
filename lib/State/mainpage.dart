import 'package:flutter/material.dart';
import 'package:test1/State/login.dart';
import 'package:test1/State/page/page.dart';
import 'package:test1/State/page/page2.dart';
import 'package:test1/utility/my_constant.dart';

class Mainpage extends StatefulWidget {
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            title: Text('SMART HOME'),
            titleTextStyle: Myconstat().h5Style(),
            shadowColor: Myconstat.primary1,
            backgroundColor: Myconstat.orange1,
            centerTitle: true,
            actions: [
              IconButton(
                  splashColor: Myconstat.blue,
                  highlightColor: Myconstat.blue,
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 30,
                  )),
            ],
            bottom: TabBar(
              tabs: [
                Tab(
                    child: Text('Device', style: Myconstat().h6Style()),
                    icon: Icon(
                      Icons.device_hub,
                      color: Myconstat.black,
                      size: 35,
                    )),
              ],
            ),
          ),
          body: TabBarView(
            children: [AddPage1()],
          ),
        ),
      );
}
