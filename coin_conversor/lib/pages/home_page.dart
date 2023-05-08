import 'package:coin_conversor/data/repositories.dart';
import 'package:flutter/material.dart';

import '../components/card_converter.dart';
import '../components/loading_page.dart';

class ConversorHomePage extends StatefulWidget {
  const ConversorHomePage({super.key});

  @override
  State<ConversorHomePage> createState() => _ConversorHpmePageState();
}

class _ConversorHpmePageState extends State<ConversorHomePage> {
  TextEditingController realController = TextEditingController();
  TextEditingController dolarController = TextEditingController();
  TextEditingController euroController = TextEditingController();
  GetData getData = GetData();
  double? dolar;
  double? euro;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
        builder: ((context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const LoadingPage(text: 'Carregando Dados...');
            default:
              if (snapshot.hasError) {
                return const LoadingPage(text: 'Erro ao Carregar Dados...');
              } else {
                dolar = snapshot.data!['results']['currencies']['USD']['buy'];
                euro = snapshot.data!['results']['currencies']['EUR']['buy'];

                return Scaffold(
                  backgroundColor: Colors.grey,
                  appBar: AppBar(
                    backgroundColor: Colors.amber,
                    title: const Center(
                      child: Text(
                        'CONVERSOR DE MOEDAS',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        CardConverter(
                            controller: realController,
                            image: 'assets/real.jpg',
                            title: 'Real Brasileiro',
                            prefix: 'R\$',
                            onChanged: realChanged),
                        const SizedBox(
                          height: 10,
                        ),
                        CardConverter(
                            controller: dolarController,
                            image: 'assets/dolar.jpg',
                            title: 'Dolar',
                            prefix: 'US\$',
                            onChanged: dolarChanged),
                        const SizedBox(
                          height: 10,
                        ),
                        CardConverter(
                            controller: euroController,
                            image: 'assets/euro.jpg',
                            title: 'Euro',
                            prefix: '€',
                            onChanged: euroChanged)
                      ],
                    ),
                  ),
                );
              }
          }
        }),
        future: getData.getConversor());
  }

  void realChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double real = double.parse(text);
    dolarController.text = (real / dolar!).toStringAsFixed(2);
    euroController.text = (real / euro!).toStringAsFixed(2);
  }

  void dolarChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar!).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar! / euro!).toStringAsFixed(2);
  }

  void euroChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double euro = double.parse(text);
    realController.text = (euro * this.euro!).toStringAsFixed(2);
    dolarController.text = (euro * this.euro! / dolar!).toStringAsFixed(2);
  }

  void _clearAll() {
    realController.text = '';
    dolarController.text = '';
    euroController.text = '';
  }
}
