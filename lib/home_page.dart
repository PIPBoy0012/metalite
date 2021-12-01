// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get title => widget.title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.amberAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amberAccent,
              ),
              child: Text('MetaLite'),
            ),
            ListTile(
              title: const Text('Posts'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Create Post'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            /*ListTile(
              title: const Text('View Posts'),
              onTap: () {
                Navigator.pop(context);
              },
            ),*/
          ],
        ),
      ),
    );
  }
}
