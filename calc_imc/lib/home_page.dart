import 'package:calc_imc/data/calc.dart';
import 'package:calc_imc/results_page.dart';
import 'package:flutter/material.dart';

import 'components/appcard.dart';
import 'components/appcount.dart';
import 'components/appiconbottom.dart';
import 'components/calcbottom.dart';

enum Sexo { masculino, feminino }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Sexo? gender;
  int idade = 25;
  int peso = 80;
  int altura = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppCard(
                        cardcolor: Colors.white,
                        cardChild: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'ALTURA(cm)',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    altura.toString(),
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            RotatedBox(
                              quarterTurns: 3,
                              child: Slider(
                                  value: altura.toDouble(),
                                  min: 100.0,
                                  max: 250.0,
                                  activeColor: Colors.green,
                                  inactiveColor: Colors.green[300],
                                  onChanged: (double newvalor) {
                                    setState(() {
                                      altura = newvalor.round();
                                    });
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: AppCard(
                          cardcolor: Colors.white,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'GÊNERO',
                                style: TextStyle(color: Colors.black),
                              ),
                              Column(
                                children: [
                                  AppIconBlockBottom(
                                    icon: Icons.male,
                                    title: 'Masculino',
                                    onTap: () {
                                      setState(() {
                                        gender = Sexo.masculino;
                                      });
                                    },
                                    colorbottom: gender == Sexo.masculino
                                        ? Colors.green
                                        : Colors.grey,
                                  ),
                                  AppIconBlockBottom(
                                      icon: Icons.female,
                                      title: 'Feminino',
                                      colorbottom: gender == Sexo.feminino
                                          ? Colors.green
                                          : Colors.grey,
                                      onTap: () {
                                        setState(() {
                                          gender = Sexo.feminino;
                                        });
                                      }),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: AppCard(
                          cardcolor: Colors.white,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'IDADE',
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                idade.toString(),
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold),
                              ),
                              AppCount(
                                incrementbottom: () {
                                  setState(() {
                                    idade++;
                                  });
                                },
                                decreasebottom: () {
                                  setState(() {
                                    idade--;
                                    idade < 0 ? idade = 0 : idade;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: AppCard(
                          cardcolor: Colors.white,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'PESO',
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                peso.toString(),
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold),
                              ),
                              AppCount(
                                incrementbottom: () {
                                  setState(() {
                                    peso++;
                                  });
                                },
                                decreasebottom: () {
                                  setState(() {
                                    peso--;
                                    peso < 0 ? peso = 0 : peso;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CalcBottom(
            text: 'CALCULAR',
            onPress: () {
              ImcCalculator calc = ImcCalculator(altura, peso);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    imc: calc.calculate(),
                    result: calc.getResult(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
