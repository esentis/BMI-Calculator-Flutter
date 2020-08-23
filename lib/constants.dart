import 'package:flutter/material.dart';

const kBottomHeightContainer = 50.0;
const kActiveCardColor = Color(0xFF512b58);
const kInactiveCardColor = Color(0x29512b58);
const kBottomContainerColor = Color(0xFFfe346e);
const kTextColor = Color(0xFFEB1555);
const kAppTitle =
    Text('BMI Calculator', style: TextStyle(fontFamily: 'FredokaOne'));
const kResultsTitle = Text('Your results',
    style: TextStyle(fontFamily: 'FredokaOne', fontSize: 50));
const kHeightLabelTextStyle = TextStyle(
    fontFamily: 'FredokaOne', fontSize: 20.0, color: Color(0xFFd2fafb));
const kHeightTextStyle = TextStyle(
  fontSize: 58.0,
  color: Color(0xFFd2fafb),
  fontFamily: 'FredokaOne',
);
const kCmTextStyle = TextStyle(
    fontSize: 18.0,
    color: Color(0xFFd2fafb),
    fontFamily: 'FredokaOne',
    fontWeight: FontWeight.w200);
const kDailyCalories = Text('Daily Calories Intake',
    style: TextStyle(fontFamily: 'FredokaOne', fontSize: 20));

class LargeBottomButton extends StatelessWidget {
  const LargeBottomButton({this.onPress, this.text});
  final Function onPress;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: kBottomContainerColor,
        margin: const EdgeInsets.only(top: 10),
        height: kBottomHeightContainer,
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 30,
                fontFamily: 'FredokaOne',
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({@required this.icon, this.onPress, this.onLongPress});
  final IconData icon;
  final Function onPress;
  final Function onLongPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(height: 60.0, width: 60.0),
      elevation: 10.0,
      onPressed: onPress,
      onLongPress: onLongPress,
      fillColor: const Color(0xFFfe346e),
      highlightColor: Colors.white,
      highlightElevation: 20.0,
      shape: const CircleBorder(),
      child: Icon(icon),
    );
  }
}

class BmiResult extends StatelessWidget {
  const BmiResult({this.text, this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontFamily: 'FredokaOne', fontSize: 30),
    );
  }
}

class BmiTitle extends StatelessWidget {
  const BmiTitle({this.text, this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontFamily: 'FredokaOne',
        fontSize: 40,
      ),
    );
  }
}

enum kGender { male, female }
