import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard({@required this.mainColor,this.cardChild,this.onPress});
  final Color mainColor;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(10.0)
        ),
      ),
    );
  }
}