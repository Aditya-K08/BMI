import 'package:flutter/material.dart';
import 'constants.dart';
class bottomButton extends StatelessWidget {
  bottomButton({@required this.ontap, @required this.bottomTitle});
  final Function ontap;
  final String bottomTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(

        child: Center(child: Text(bottomTitle ,style: kNumberTextStyle),),
        color: Color(0xFF4D8AC7),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,

      ),
    );
  }
}