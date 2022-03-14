import 'package:flutter/material.dart';
import 'package:test1/State/login.dart';
import 'package:test1/State/register.dart';
import 'package:test1/utility/my_constant.dart';

final Map<String, WidgetBuilder> map = {
  '/login': (BuildContext context) => Login(),
  '/register': (BuildContext context) => Register(),
};
String? initlalRoute;
void main() {
  initlalRoute = Myconstat.routelogin;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Myconstat.appName,
      routes: map,
      initialRoute: initlalRoute,
    );
  }
}
