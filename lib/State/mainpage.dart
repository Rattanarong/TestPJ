import 'package:flutter/material.dart';
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
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('SMART HOME'),
            titleTextStyle: Myconstat().h5Style(),
            shadowColor: Myconstat.primary1,
            backgroundColor: Myconstat.orange1,
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                    child: Text('Device', style: Myconstat().h6Style()),
                    icon: Icon(
                      Icons.device_hub,
                      color: Myconstat.black,
                      size: 30,
                    )),
                Tab(
                    child: Text('Options', style: Myconstat().h6Style()),
                    icon: Icon(
                      Icons.blur_on,
                      color: Myconstat.black,
                      size: 30,
                    )),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              AddPage1(),
              options()
            ],
          ),
        ),
      );
}
