import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResult,@required this.bmiNumber,@required this.bmiExplain});

  final Widget bmiResult;
  final String bmiNumber;
  final Widget bmiExplain;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: kAppTitle),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: kResultsTitle,
          ),
          Expanded(
            flex:5,
            child: ReusableCard(
              mainColor: kActiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Center(child: bmiResult,),
                  Center(child: Text(bmiNumber,
                    style: TextStyle(
                      fontSize: 120,
                      fontFamily: 'FredokaOne'
                    ),
                  ),),
                  Center(child: bmiExplain,),
                ],
              ),
            ),
          ),
          LargeBottomButton(
            text: "RE-CALCULATE",
            onPress: (){
              Navigator.pop(context);
            },
          )
        ],
      ),

    );
  }
}
