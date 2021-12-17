// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class Feedpage extends StatefulWidget{
  Feedpage({Key? key}) : super(key: key);

  @override
  FeedPageState createState() => FeedPageState();
}

class FeedPageState extends State<Feedpage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
          ),
          
          body: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index,){
                    return Container(
                      alignment: Alignment.center,
                      child:  Text(title),
                      c
                  

                    );
                  }
                )
                )
            ],
            
            // Listtile: Image.asset('assets/MetaLite.jpg'),
            // for(Post in db){
            //   child: Container(Post)
            // }
            ),
    );
  }
}

class Post extends StatelessWidget{
  Post({Key? key, required posttitle, required Description, Image, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}


