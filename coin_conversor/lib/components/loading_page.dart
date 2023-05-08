

import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Carregando Dados...',
        style: TextStyle(color: Colors.amber, fontSize: 25),
        textAlign: TextAlign.center,
      ),
    );
  }
}
