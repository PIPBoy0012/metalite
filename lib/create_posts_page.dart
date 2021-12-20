// ignore_for_file: unused_local_variable

import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'models/postModel.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

/*
  "postId": 0,
  "title": "New game!!!",
  "describstion": "We released a new game!!!!!",
  "image": "NewgameIMG"
*/

class CreatePost extends StatefulWidget {
  CreatePost({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _CreatePostState createState() => _CreatePostState();
}

Future<PostModel> createPost(
    String title, String describstion, String image) async {
  final String apiUrl = "http://10.0.2.2:5000/user";
  final response = await http.post(Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
        'describstion': describstion,
        'image': image
      }));

  if (response.statusCode == 200) {
    return PostModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('failed to create Post ' + response.statusCode.toString());
  }
}

class _CreatePostState extends State<CreatePost> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on Platform catch (e) {
      print("Failed to pick image: $e");
    }
  }

  TextEditingController _describstion = TextEditingController();
  TextEditingController _title = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 160,
              height: 160,
              child: image != null
                  ? Image.file(image!)
                  : Image.asset('assets/MetaLite.jpg')),
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50, bottom: 10),
            child: TextFormField(
              controller: _title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Enter Title',
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 50, right: 50, bottom: 10),
              child: TextFormField(
                controller: _describstion,
                obscureText: true,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'Enter Description',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              )),
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.amberAccent),
            child: MaterialButton(
              onPressed: () {
                pickImage();
              },
              child: Text('Pick image from gallery'),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.amberAccent),
            child: MaterialButton(
              onPressed: () {},
              child: Text('Take picture with camera'),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.amberAccent),
            child: MaterialButton(
              onPressed: () {},
              child: Text('Publish Post'),
            ),
          ),
        ],
      )),
    );
  }
}
