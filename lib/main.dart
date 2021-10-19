// import 'package:flutter/material.dart';
// import 'package:test1/State/Dasktop.dart';
// import 'package:test1/State/Login.dart';
// import 'package:test1/State/Register.dart';
// import 'package:test1/utility/my_constant.dart';

// final Map<String, WidgetBuilder> map = {
//   '/dasktop': (BuildContext context) => Dasktop(),
//   '/login': (BuildContext context) => Login(),
//   '/register': (BuildContext context) => Register(),
// };

// String? initlalRoute;

// void main() {
//   initlalRoute = Myconstat.routedasktop;
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: Myconstat.appName,
//       routes: map,
//       initialRoute: initlalRoute,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:test1/State/add.dart';
import 'package:test1/utility/my_constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Myconstat.appName,
      home: AddPage(),
    );
  }
}
