import 'package:flutter/material.dart';
import 'package:test1/utility/my_constant.dart';
import 'package:test1/widgets/show_image.dart';
import 'package:test1/widgets/show_title.dart';

class MyDailog {
  Future<Null> normalDialog(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: ListTile(
          leading: ShowImage(
            path: Myconstat.image1,
          ),
          title: ShowTitle(title: title, textStyle: Myconstat().h2Style()),
          subtitle: ShowTitle(title: message, textStyle: Myconstat().h3Style()),
        ),
        children: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))
        ],
      ),
    );
  }
}
