import 'package:flutter/material.dart';

class Myconstat {
  static String appName = 'Smart home';
  static String domain = 'https://f800-183-89-66-98.ngrok.io';

  static String routelogin = '/login';
  static String routedasktop = '/dasktop';
  static String routeregister = '/register';

  static String image1 = 'images/Smart home.png';

  static Color primary = Color(0xfff9c12d); //เหลือง
  static Color dark = Color(0xffc29100);
  static Color light = Color(0xfffff363);
  static Color primary1 = Color(0xff00e5ff); //เขียวฟ้า
  static Color dark1 = Color(0xff00b2cc);
  static Color light1 = Color(0xff6effff);
  static Color primary2 = Color(0xff5d4037); //สีน้ำตาล
  static Color dark2 = Color(0xff321911);
  static Color light2 = Color(0xff8b6b61);

  TextStyle h1Style() => TextStyle(
        fontSize: 24,
        color: dark,
        fontWeight: FontWeight.bold,
      );

  TextStyle h2Style() => TextStyle(
        fontSize: 18,
        color: dark,
        fontWeight: FontWeight.w700,
      );

  TextStyle h3Style() => TextStyle(
        fontSize: 14,
        color: dark,
        fontWeight: FontWeight.normal,
      );

  TextStyle h4Style() => TextStyle(
        fontSize: 30,
        color: dark,
        fontWeight: FontWeight.bold,
      );

  ButtonStyle MyButtonStyle() => ElevatedButton.styleFrom(
        primary: Myconstat.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      );
}
