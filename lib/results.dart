import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'button_button.dart';
class ResultsPage  extends StatelessWidget {
  ResultsPage({ this.bmiResult, this.interpretation, this.resulttext});
  final String bmiResult;
  final String resulttext;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('BMI CALCULATOR',
          style: kLabelTextStyle,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            child: Center(child: Text
              ('YOUR RESULT',style: kTitleTextStyle,
            ),
            ),
          ),
          ),
          Expanded
            ( flex: 5,
            child: ReusableCard(
              colour:kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resulttext.toUpperCase(),style: kResultTextStyle,),
                  Text(bmiResult,style: kBMITextStyle,),
                  Text(interpretation.toUpperCase(),style: kBodyTextStyle,textAlign: TextAlign.center,)
                ],
              ),
            ),
          ),
          bottomButton(  bottomTitle: 'RE- CALCULATE',
            ontap: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
