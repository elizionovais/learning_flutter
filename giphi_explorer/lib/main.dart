import 'package:flutter/material.dart';
import 'package:giphi_explorer/pages/home_page.dart';

void main() {
  runApp(const GifApp());
}

class GifApp extends StatelessWidget {
  const GifApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GIPHI Explorer',
      theme: ThemeData(
        hintColor: Colors.white,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const HomePage(),
    );
  }
}
