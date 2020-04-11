import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'constants.dart';

class CalculatorBrain {

  CalculatorBrain({this.weight,this.height,this.age,this.gender});
  final int weight;
  final int height;
  final int age;
  kGender gender;
  double _dailyCalories;
  double _bmi;

  Widget calculateBmi(){
    GlobalKey _toolTipKey = GlobalKey();
    _bmi = weight/pow(height/100,2);
    return Column(
      children: <Widget>[
        Text('TAP FOR MORE INFO',style: TextStyle(fontFamily: 'FredokaOne'),),
        GestureDetector(
          onTap: (){
            final dynamic tooltip = _toolTipKey.currentState;
            tooltip.ensureTooltipVisible();
          },
          child: Tooltip(
              padding: EdgeInsets.all(20),
              height: 40,
              key: _toolTipKey,
              message: 'Very severely underweight: 0-15'
                  '\nSeverely underweight: 15-16'
                  '\nUnderweight: 16-18.5'
                  '\nNormal: 18.5-25'
                  '\nOverweight: 25-30'
                  '\nModerately Obese: 30-35'
                  '\nSeverely obese: 35-40'
                  '\nVery severely obese: 40-',
              textStyle: TextStyle(
                fontFamily: 'FredokaOne',
                fontSize: 20,
                color: Colors.red
              ),
              child: Text(_bmi.toStringAsFixed(1),
              style: TextStyle(
                fontSize: 75,
                fontWeight: FontWeight.w900,
                fontFamily: 'FredokaOne',

              ),)),
        ),
      ],
    );

  }

  Widget getResults(){
    if (_bmi>=25.0){
      return BmiTitle(text:'OVERWEIGHT',color : Color(0xFFdd2c00));
    }else if (_bmi>18.5){
      return BmiTitle(text:'NORMAL',color: Color(0xFF639a67));
    }else {
      return BmiTitle(text:'UNDERWEIGHT',color : Color(0xFFb2ebf2));
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

  Widget dailyCalorieIntake(){

    if (gender==kGender.male){
      //Mifflin St Jeor Equation
      _dailyCalories = (weight*10)+(height*6.25)-(age*5)+5;
    }else {
      //Mifflin St Jeor Equation
      _dailyCalories = (weight*10)+(height*6.25)-(age*5)-161;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Tooltip(
          message: 'This is an approximation.',
          height: 5.0,
          verticalOffset: 48,
          waitDuration: Duration(seconds: 1),
          textStyle: TextStyle(
              fontFamily: 'FredokaOne',
              fontWeight: FontWeight.w100,
              color: Color(0xFFD00002),
              fontSize: 20
          ),
          showDuration: Duration(seconds: 2),
          child: Text(_dailyCalories.toStringAsFixed(0),style: TextStyle(
            fontFamily: 'FredokaOne',
            fontWeight: FontWeight.w100,
            fontSize: 50
          ),),
        ),
        SizedBox(width: 10.0,),
        Text('calories',style: TextStyle(
    fontFamily: 'FredokaOne',
    fontWeight: FontWeight.w100,
    color: Color(0xFFD00002),
    fontSize: 40
    )),
      ],
    );
  }

}