import 'package:calc_imc/components/appcard.dart';
import 'package:flutter/material.dart';

import 'components/calcbottom.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.imc, required this.result});

  final String imc;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: AppCard(
              cardcolor: Colors.grey,
              cardChild: const Text('RESULTADO',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 5,
            child: AppCard(
              cardcolor: Colors.white,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(result,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 30)),
                  Text(imc,
                      style: const TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                  const Text('Recomendações:',
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                ],
              ),
            ),
          ),
          CalcBottom(
            text: 'RECALCULAR',
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
