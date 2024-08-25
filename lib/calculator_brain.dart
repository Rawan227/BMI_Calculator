import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  late double _BMI;
  // final int age;

  CalculatorBrain({required this.height, required this.weight}){
    _BMI = weight / pow(height / 100.0, 2);
  }

  String calculateBMI() {
    return _BMI.toStringAsFixed(1);
  }

  String calculateResult() {
    if (_BMI < 18.5) {
      return 'Underweight';
    } else if (_BMI >= 25) {
      return 'Overweight';
    } else {
      return 'Normal';
    }
  }

  String getcaption() {
    if (_BMI < 18.5) {
      return 'you have less than the normal body weight. Eat more!';
    } else if (_BMI >= 25) {
      return 'You have more than the normal body weight. Try to exersice!';
    } else {
      return 'You have a normal body weight. Fantastic!';
    }
  }
}
