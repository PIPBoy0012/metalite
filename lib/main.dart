// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:metalite/home_page.dart';

import 'login_page.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'dart:io';
import 'posts.dart';

/*void main() => runApp(MyApp());

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
}*/

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`

  WidgetsFlutterBinding.ensureInitialized();

  //Getting list of cameras
  final cameras = await availableCameras();

  //Getting the first camera available
  final firstCamera = cameras.first;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: recursive_getters
  get firstCamera => firstCamera;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        /*home: TakePictureScreen(
        camera: firstCamera,
      ),*/
        home: MyLoginPage(
          title: 'metalite',
        ));
  }
}
