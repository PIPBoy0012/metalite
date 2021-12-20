// ignore_for_file: prefer_const_constructors_in_immutables, unused_local_variable
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'home_page.dart';
import 'models/userModel.dart';
import 'package:http/http.dart' as http;

class MyRegisterPage extends StatefulWidget {
  MyRegisterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyRegisterPageState createState() => _MyRegisterPageState();
}

Future<UserModel> createUser(
    String username, String password, String email) async {
  final String apiUrl = "http://localhost:5000/user";

  final response = await http.post(Uri.parse(apiUrl),
      body: {"username": username, "email": email, "password": password});

  if (response.statusCode == 200) {
    final String responseString = response.body;

    return userModelFromJson(responseString);
  } else {
    throw Exception('failed to create user');
  }
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  get title => widget.title;
  late UserModel _user;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50, bottom: 10),
            child: TextFormField(
              controller: _emailController,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Email',
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
                controller: _usernameController,
                obscureText: true,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'Username',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              )),
          Padding(
              padding: EdgeInsets.only(left: 50, right: 50, bottom: 10),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              )),
          _user == null
              ? Container()
              : Text(
                  "The user ${_user.username}, ${_user.email} is created successfully at time ${_user.createdAt.toIso8601String()}"),
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.amberAccent),
            child: MaterialButton(
              onPressed: () async {
                final int UserId = 1;
                final String Email = _emailController.text;
                final String Username = _usernameController.text;
                final String Password = _passwordController.text;

                print('Email: ' + _emailController.text);
                print('Username: ' + _usernameController.text);
                print('Password: ' + _passwordController.text);

                final UserModel user =
                    await createUser(Email, Username, Password);

                setState(() {
                  _user = user;
                });
              },
              child: Text('Register'),
            ),
          ),
        ],
      )),
    );
  }
}
