import 'package:bmi_calculator/components/calculator_brain.dart';
import 'package:bmi_calculator/pages/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/gender_card.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = kInactiveCardColor;
  Color femaleColor = kInactiveCardColor;
  kGender selectedGender;
  int weight = 65;
  int height = 165;
  int age = 18;
  bool tapping;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: kAppTitle,
        ),
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
                        selectedGender = kGender.male;
                      });
                    },
                    mainColor: selectedGender == kGender.male
                        ? maleColor = kActiveCardColor
                        : maleColor = kInactiveCardColor,
                    cardChild: GenderCard(
                      icon: FontAwesomeIcons.mars,
                      iconColor: selectedGender == kGender.male
                          ? maleColor = Colors.blue
                          : maleColor = const Color(0x29d2fafb),
                      iconSize: 100.0,
                      text: 'Male',
                      textFont: 'FredokaOne',
                      textSize: 20.0,
                      textColor: selectedGender == kGender.male
                          ? maleColor = Colors.blue
                          : maleColor = const Color(0x29d2fafb),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = kGender.female;
                      });
                    },
                    mainColor: selectedGender == kGender.female
                        ? femaleColor = kActiveCardColor
                        : femaleColor = kInactiveCardColor,
                    cardChild: GenderCard(
                      icon: FontAwesomeIcons.venus,
                      iconSize: 100.0,
                      iconColor: selectedGender == kGender.female
                          ? femaleColor = Colors.pink
                          : femaleColor = const Color(0x29d2fafb),
                      text: 'Female',
                      textFont: 'FredokaOne',
                      textSize: 20.0,
                      textColor: selectedGender == kGender.female
                          ? femaleColor = Colors.pink
                          : femaleColor = const Color(0x29d2fafb),
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
                  const Text(
                    'HEIGHT',
                    style: kHeightLabelTextStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: SleekCircularSlider(
                        min: 120,
                        max: 210,
                        initialValue: 150,
                        appearance: CircularSliderAppearance(
                          size: 160,
                          infoProperties: InfoProperties(
                            modifier: (value) {
                              var roundedValue =
                                  value.ceil().toInt().toString();
                              return '$roundedValue cm';
                            },
                            mainLabelStyle: const TextStyle(
                              fontSize: 30,
                              fontFamily: 'FredokaOne',
                            ),
                          ),
                          customColors: CustomSliderColors(
                            //GRADIENT SLIDER FOR HEIGHT
                            progressBarColors: [
                              const Color(0xFFEB1555),
                              const Color(0xFFfe346e),
                              const Color(0xFF512b58)
                            ],
                          ),
                        ),
                        onChange: (double value) {
                          setState(() {
                            height = value.toInt();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    mainColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Expanded(
                          child: Text(
                            'WEIGHT',
                            style: kHeightLabelTextStyle,
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: kHeightTextStyle,
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              onLongPress: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    mainColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Expanded(
                          child: Text(
                            'AGE',
                            style: kHeightLabelTextStyle,
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: kHeightTextStyle,
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          LargeBottomButton(
            text: 'CALCULATE',
            onPress: () {
              var calc = CalculatorBrain(
                weight: weight,
                height: height,
                age: age,
                gender: selectedGender,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiNumber: calc.calculateBmi(),
                    bmiResult: calc.getResults(),
                    bmiExplain: calc.resultsExplain(),
                    dailyCalories: calc.dailyCalorieIntake(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
