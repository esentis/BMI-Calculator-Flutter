import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({
    @required this.bmiResult,
    @required this.bmiNumber,
    @required this.bmiExplain,
    this.dailyCalories,
  });

  final Widget bmiResult;
  final Widget bmiNumber;
  final Widget bmiExplain;
  final Widget dailyCalories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: kAppTitle),
      ),
      body: Column(
        children: <Widget>[
          const Expanded(
            child: kResultsTitle,
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              mainColor: kActiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Center(
                    heightFactor: 0,
                    child: bmiResult,
                  ),
                  Center(
                    heightFactor: 1,
                    child: bmiNumber,
                  ),
                  Center(
                    heightFactor: 1,
                    child: bmiExplain,
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Center(
                child: kDailyCalories,
              ),
              Container(
                  child: ReusableCard(
                mainColor: kActiveCardColor,
                cardChild: dailyCalories,
              ))
            ],
          ),
          LargeBottomButton(
            text: 'RE-CALCULATE',
            onPress: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
