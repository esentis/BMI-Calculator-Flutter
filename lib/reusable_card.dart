import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    @required this.mainColor,
    this.cardChild,
    this.onPress,
    this.height,
    this.width,
  });
  final Color mainColor;
  final Widget cardChild;
  final Function onPress;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        child: cardChild,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
