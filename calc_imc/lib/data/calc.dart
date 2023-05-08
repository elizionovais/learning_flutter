import 'dart:math';

class ImcCalculator {
  int height;
  int weight;

  ImcCalculator(this.height, this.weight);

  String calculate() {
    double imc = (weight / (pow(height / 100, 2)));
    return imc.toStringAsFixed(2);
  }

  String getResult() {
    double imc = (weight / (pow(height / 100, 2)));
    if (imc < 18.5) {
      return 'Abaixo do peso';
    } else if (imc >= 18.5 && imc < 25) {
      return 'Peso normal';
    } else if (imc >= 25 && imc < 30) {
      return 'Sobrepeso';
    } else if (imc >= 30 && imc < 35) {
      return 'Obesidade grau 1';
    } else if (imc >= 35 && imc < 40) {
      return 'Obesidade grau 2';
    } else {
      return 'Obesidade grau 3';
    }
  }
}
