// ignore_for_file: prefer_const_constructors_in_immutables, unused_local_variable
// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'models/userModel.dart';
import 'package:http/http.dart' as http;
import 'login_page.dart';

Future<UserModel> createUser(
    String username, String password, String email) async {
  final response = await http.post(
    Uri.parse("http://10.0.2.2:5000/user"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
      'email': email,
    }),
  );

  if (response.statusCode == 201) {
    return UserModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('failed to create user ' + response.statusCode.toString());
  }
}

class MyRegisterPage extends StatefulWidget {
  MyRegisterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyRegisterPageState createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  get title => widget.title;
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
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.amberAccent),
            child: MaterialButton(
              onPressed: () async {
                final String email = _emailController.text;
                final String username = _usernameController.text;
                final String password = _passwordController.text;

                print('Email: ' + _emailController.text);
                print('Username: ' + _usernameController.text);
                print('Password: ' + _passwordController.text);

                if (email.isEmpty || username.isEmpty || password.isEmpty) {
                  Widget okButton = TextButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  );

                  AlertDialog alert = AlertDialog(
                    title: Text("Error"),
                    content: Text("You need to enter data in the fields"),
                    actions: [okButton],
                  );

                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      });
                } else {
                  Widget okButton = TextButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyLoginPage(
                            title: title,
                          ),
                        ),
                      );
                    },
                  );

                  AlertDialog alert = AlertDialog(
                    title: Text("Success"),
                    content: Text("User has been Created"),
                    actions: [okButton],
                  );

                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      });
                  final UserModel user =
                      await createUser(username, password, email);
                }
              },
              child: Text('Register'),
            ),
          ),
        ],
      )),
    );
  }
}
