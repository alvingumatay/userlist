//ignore_for_file: unused_import, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:userlist/screen/home.dart';
import 'package:userlist/screen/create.dart';
import 'package:userlist/screen/details.dart';
import 'package:userlist/screen/edit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/create': (create) => Create(),
        '/details': (context) => Details(),
        '/edit': (context) => Edit(),
      },
    );
  }
}
