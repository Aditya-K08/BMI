import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  ReusableCard({ this.colour,  this.cardChild});
  Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}