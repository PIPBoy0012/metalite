// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MetaLite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyLoginPage(
        title: 'MetaLite',
      ),
    );
  }
}
