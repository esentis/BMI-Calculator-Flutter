import 'dart:math';

import 'package:flutter/material.dart';
import '../constants.dart';

class CalculatorBrain {
  CalculatorBrain({this.weight, this.height, this.age, this.gender});
  final int weight;
  final int height;
  final int age;
  kGender gender;
  double _dailyCalories;
  double _bmi;

  Color toolTipTextColor() {
    if (_bmi >= 25.0) {
      return Colors.red;
    } else if (_bmi > 18.5) {
      return Colors.green;
    } else {
      return Colors.cyan;
    }
  }

  Widget calculateBmi() {
    var _toolTipKey = GlobalKey();
    _bmi = weight / pow(height / 100, 2);
    return Column(
      children: <Widget>[
        const Text(
          'TAP FOR MORE INFO',
          style: TextStyle(fontFamily: 'FredokaOne'),
        ),
        GestureDetector(
          onTap: () {
            dynamic tooltip = _toolTipKey.currentState;
            tooltip.ensureTooltipVisible();
          },
          child: Tooltip(
              padding: const EdgeInsets.all(20),
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
                  color: toolTipTextColor()),
              child: Text(
                _bmi.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 75,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'FredokaOne',
                ),
              )),
        ),
      ],
    );
  }

  Widget getResults() {
    if (_bmi >= 25.0) {
      return const BmiTitle(
        text: 'OVERWEIGHT',
        color: Color(0xFFdd2c00),
      );
    } else if (_bmi > 18.5) {
      return const BmiTitle(
        text: 'NORMAL',
        color: Color(0xFF639a67),
      );
    } else {
      return const BmiTitle(
        text: 'UNDERWEIGHT',
        color: Color(0xFFb2ebf2),
      );
    }
  }

  Widget resultsExplain() {
    if (_bmi >= 25.0) {
      return const BmiResult(
        text:
            'You are overweight, please adapt a better diet and try to exercise more.',
        color: Color(0xFFdd2c00),
      );
    } else if (_bmi > 18.5) {
      return const BmiResult(
        text:
            'You are normal, keep it up this way and dont forget to exercise.',
        color: Color(0xFF639a67),
      );
    } else {
      return const BmiResult(
        text: 'You are underweight, you have to eat more and exercise.',
        color: Color(0xFFb2ebf2),
      );
    }
  }

  Widget dailyCalorieIntake() {
    var _toolTip = GlobalKey();

    if (gender == kGender.male) {
      //Mifflin St Jeor Equation
      _dailyCalories = (weight * 10) + (height * 6.25) - (age * 5) + 5;
    } else {
      //Mifflin St Jeor Equation
      _dailyCalories = (weight * 10) + (height * 6.25) - (age * 5) - 161;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            dynamic tooltip = _toolTip.currentState;
            tooltip.ensureTooltipVisible();
          },
          child: Tooltip(
            key: _toolTip,
            message: 'This is an approximation.',
            height: 5.0,
            verticalOffset: 48,
            waitDuration: const Duration(seconds: 1),
            textStyle: TextStyle(
                fontFamily: 'FredokaOne',
                fontWeight: FontWeight.w100,
                color: toolTipTextColor(),
                fontSize: 20),
            showDuration: const Duration(seconds: 2),
            child: Text(
              _dailyCalories.toStringAsFixed(0),
              style: const TextStyle(
                  fontFamily: 'FredokaOne',
                  fontWeight: FontWeight.w100,
                  fontSize: 50),
            ),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text('calories',
            style: TextStyle(
                fontFamily: 'FredokaOne',
                fontWeight: FontWeight.w100,
                color: toolTipTextColor(),
                fontSize: 40)),
      ],
    );
  }
}
