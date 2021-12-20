import 'package:flutter/material.dart';

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

class _CreatePostState extends State<CreatePost> {
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
