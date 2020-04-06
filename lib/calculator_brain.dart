import 'dart:math';

class CalculatorBrain {

  CalculatorBrain({this.weight,this.height});
  final int weight;
  final int height;
  double _bmi;

  String calculateBmi(){

    _bmi = weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults(){
    if (_bmi>=25.0){
      return 'Overweight';
    }else if (_bmi>18.5){
      return 'Normal';
    }else {
      return 'Underweight';
    }
  }

  String resultsExplain(){
    if (_bmi>=25.0){
      return 'You have to lose some weight ASAP';
    }else if (_bmi>18.5){
      return 'You are fine';
    }else {
      return 'You have to eat more';
    }
  }

}