// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('http://10.0.2.2:5000/mypost'));
  print('API Response: ' + response.toString());
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body[0]));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album' + response.statusCode.toString());
  }
}

class Album {
  final int id;
  final String title;
  final String describtion;
  final String? image;

  Album({
    required this.id,
    required this.title,
    required this.describtion,
    this.image
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['titel'],
      describtion: json['describtion'],
      image: json['image']

    );
  }
}

class Feedpage extends StatefulWidget{
  Feedpage({Key? key}) : super(key: key);
  
  FeedPageState createState() => FeedPageState();
}

class FeedPageState extends State<Feedpage>{
  late Future<Album> futureAlbum;

  @override
  void initState() {
    futureAlbum = fetchAlbum();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
          ),
          body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}' + ' Test Failed');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
            // slivers: <Widget>[
            //   SliverList(
            //     delegate: SliverChildBuilderDelegate(
            //       (BuildContext context, int index){
            //         final children = <Widget>[];
            //         for (var i = 0; i < 10; i++) {
            //           children.add(new ListTile());
            //         }
            //         return new ListView(
            //           children: Post(),

            //         );
            //       }
            //     )
            //     )
            // ],
            
            // Listtile: Image.asset('assets/MetaLite.jpg'),
            // for(Post in db){
            //   child: Container(Post)
            // }
    );
  }
}






