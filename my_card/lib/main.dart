import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.yellow[600],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_constructors
              CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage('assets/elizio.png'),
                radius: 50.0,
              ),
              Text(
                'Elizio Novais',
                style: TextStyle(
                    color: Colors.black, fontSize: 30.0, fontFamily: 'Phudu'),
              ),
              Text(
                'Engenheiro Eletricista',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontFamily: 'Phudu',
                    letterSpacing: 5.0),
              ),
              SizedBox(
                height: 20.0,
                width: 250.0,
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Card(
                color: Colors.grey[400],
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.yellow,
                  ),
                  title: Text('(33) 9 98051842'),
                ),
              ),
              Card(
                color: Colors.grey[400],
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.yellow,
                  ),
                  title: Text('elizio.neto@outlook.com'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
