import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'constants.dart';

class CalculatorBrain {

  CalculatorBrain({this.weight,this.height});
  final int weight;
  final int height;
  double _bmi;

  String calculateBmi(){

    _bmi = weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  Widget getResults(){
    if (_bmi>=25.0){
      return BmiResult(text:'OVERWEIGHT',color : Color(0xFFdd2c00));
    }else if (_bmi>18.5){
      return BmiResult(text:'NORMAL',color: Color(0xFF639a67));
    }else {
      return BmiResult(text:'UNDERWEIGHT',color : Color(0xFFb2ebf2));
    }
  }

  Widget resultsExplain(){
    if (_bmi>=25.0){
      return BmiResult(text:'You are overweight, please adapt a better diet and try to exercise more.',color : Color(0xFFdd2c00));
    }else if (_bmi>18.5){
      return BmiResult(text:'You are normal, keep it up this way and dont forget to exercise.',color: Color(0xFF639a67));
    }else {
      return BmiResult(text:'You are underweight, you have to eat more and exercise.',color : Color(0xFFb2ebf2));
    }
  }

}