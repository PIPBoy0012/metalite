// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'home_page.dart';
import 'register_page.dart';

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  get title => widget.title;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 250,
              height: 250,
              child: Image.asset('assets/MetaLite.jpg')),
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
            ),
          ),
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
              onPressed: () {
                print('Username: ' + _usernameController.text);
                print('Password: ' + _passwordController.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(
                      title: title,
                    ),
                  ),
                );
              },
              child: Text('Log in'),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.amberAccent),
            child: MaterialButton(
              onPressed: () {
                print('Username: ' + _usernameController.text);
                print('Password: ' + _passwordController.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyRegisterPage(
                      title: title,
                    ),
                  ),
                );
              },
              child: Text('Register'),
            ),
          ),
        ],
      )),
    );
  }
}
