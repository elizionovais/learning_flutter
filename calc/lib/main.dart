import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// Classe principal e nao muda
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('CALCULADORA'),
        ),
        body: Fcalc(),
      ),
    );
  }
}

// Classe que atualiza com a interação do usuário
class Fcalc extends StatefulWidget {
  const Fcalc({super.key});

  @override
  State<Fcalc> createState() => _FcalcState();
}

class _FcalcState extends State<Fcalc> {
  //declaração de variaveis e funções entram aqui
  String visor = 'Monitor';
// Função para criar os botões
  TextButton botao({String? tecla, String? texto, required Color cor}) {
    return TextButton(
      onPressed: () {
        setState(() {
          visor = texto!;
        });
      },
      child: Container(
        child: Center(
          child: Text(
            tecla!,
            style: TextStyle(color: cor, fontSize: 20.0),
          ),
        ),
      ),
    );
  }

// build do app
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        color: Colors.white,
        height: 100.0,
        width: 350.0,
        child: Center(child: Text(visor)),
      ),
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            botao(texto: 'C', tecla: 'C', cor: Colors.blue),
            botao(texto: 'DELETAR', tecla: 'DEL', cor: Colors.blue),
            botao(texto: '%', tecla: '%', cor: Colors.blue),
            botao(texto: 'Divisão', tecla: '/', cor: Colors.blue),
          ],
        ),
      ),
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            botao(texto: 'Numero 7', tecla: '7', cor: Colors.white),
            botao(texto: 'Numero 8', tecla: '8', cor: Colors.white),
            botao(texto: 'Numero 9', tecla: '9', cor: Colors.white),
            botao(texto: 'Multiplicação', tecla: '*', cor: Colors.blue),
          ],
        ),
      ),
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            botao(texto: 'Numero 4', tecla: '4', cor: Colors.white),
            botao(texto: 'Numero 5', tecla: '5', cor: Colors.white),
            botao(texto: 'Numero 6', tecla: '6', cor: Colors.white),
            botao(texto: 'Adição', tecla: '+', cor: Colors.blue),
          ],
        ),
      ),
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            botao(texto: 'Numero 1', tecla: '1', cor: Colors.white),
            botao(texto: 'Numero 2', tecla: '2', cor: Colors.white),
            botao(texto: 'Numero 3', tecla: '3', cor: Colors.white),
            botao(texto: 'Subtração', tecla: '-', cor: Colors.blue),
          ],
        ),
      ),
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            botao(texto: 'Numero 0', tecla: '0', cor: Colors.white),
            botao(texto: 'Ponto', tecla: '.', cor: Colors.white),
            botao(texto: 'Igual', tecla: '=', cor: Colors.blue),
          ],
        ),
      ),
    ]);
  }
}
