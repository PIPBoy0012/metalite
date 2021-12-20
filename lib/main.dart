// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:metalite/home_page.dart';

import 'login_page.dart';
import 'dart:async';
import 'dart:io';
import 'posts.dart';

//http://10.0.2.2:5000/user

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
