import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const CalculadoraIMC());
}

class CalculadoraIMC extends StatelessWidget {
  const CalculadoraIMC({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.grey,
      ),
      initialRoute: '/Home',
      routes: {
        '/Home': (context) => const HomePage(),
      },
    );
  }
}