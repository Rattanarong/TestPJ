import 'package:flutter/material.dart';
import 'package:test1/State/swone.dart';

class LED1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: FirstSwitch(),
          ),
        ],
      ),
    );
  }
}
