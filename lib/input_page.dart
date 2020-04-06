

import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'gender_card.dart';
import 'reusable_card.dart';
import 'constants.dart';


enum Gender {
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleColor = kInactiveCardColor;
  Color femaleColor = kInactiveCardColor;
  Gender selectedGender;
  int weight = 65;
  int height = 165;
  int age = 18;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Center(child: kAppTitle),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      mainColor: selectedGender==Gender.male ? maleColor=kActiveCardColor : maleColor=kInactiveCardColor,
                      cardChild: GenderCard(
                        icon: FontAwesomeIcons.mars,
                        iconColor: selectedGender==Gender.male ? maleColor=Colors.blue : maleColor=Color(0x29d2fafb),
                        iconSize : 100.0,
                        text: "Male",
                        textFont: 'FredokaOne',
                        textSize: 20.0,
                        textColor: selectedGender==Gender.male ? maleColor=Colors.blue : maleColor=Color(0x29d2fafb),
                      ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      mainColor: selectedGender==Gender.female ? femaleColor=kActiveCardColor : femaleColor=kInactiveCardColor,
                      cardChild: GenderCard(
                          icon: FontAwesomeIcons.venus,
                          iconSize: 100.0,
                          iconColor: selectedGender==Gender.female ? femaleColor=Colors.pink : femaleColor=Color(0x29d2fafb),
                          text: "Female",
                          textFont: 'FredokaOne',
                          textSize: 20.0,
                          textColor: selectedGender==Gender.female ? femaleColor=Colors.pink : femaleColor=Color(0x29d2fafb),
                      ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                mainColor: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("HEIGHT",
                      style: kHeightLabelTextStyle,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(),style: kHeightTextStyle,),
                        SizedBox(width: 10,),
                        Text("cm",style: kCmTextStyle,)
                    ],),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Color(0xFFd2fafb),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 25),
                        thumbColor: Color(0xFFfe346e),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 45),
                        inactiveTrackColor: Color(0x29d2fafb),
                        overlayColor: Color(0x29fe346e)
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min : 120.0,
                        max : 220,
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(mainColor: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    Text("WEIGHT",style: kHeightLabelTextStyle,),
                    Text(weight.toString(), style: kHeightTextStyle,),
                    SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      RoundIconButton(
                          icon :FontAwesomeIcons.minus,
                          onPress:(){
                            setState(() {
                               weight--;
                            });
                          },
                      ),
                      SizedBox(width: 10.0,
                      ),
                      RoundIconButton(
                          icon:FontAwesomeIcons.plus,
                          onPress:(){
                            setState(() {
                            weight++;
                          });
                      }),
                    ],),
                  ],),),
                ),
                Expanded(
                  child: ReusableCard(mainColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("AGE",style: kHeightLabelTextStyle,),
                        Text(age.toString(), style: kHeightTextStyle,),
                        SizedBox(
                          height: 12.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon :FontAwesomeIcons.minus,
                              onPress:(){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0,
                            ),
                            RoundIconButton(
                                icon:FontAwesomeIcons.plus,
                                onPress:(){
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],),
                      ],),),
                ),
              ],
            ),
          ),
          LargeBottomButton(
            text: "CALCULATE",
            onPress: (){
              CalculatorBrain calc = new CalculatorBrain(weight: weight,height: height);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ResultsPage(
                  bmiNumber: calc.calculateBmi(),
                  bmiResult: calc.getResults(),
                  bmiExplain: calc.resultsExplain(),
                )
              ),);
            },
          ),
        ],
      ),
    );
  }
}







