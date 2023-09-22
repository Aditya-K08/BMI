import 'package:bmi/results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
//import 'results.dart';
import 'button_button.dart';
import 'round_icon_button.dart';
import 'calculator_brain.dart';
enum Gender {
  male,
  female,
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height=180;
  int weight=60;
  int age=20;

  Color maleCardColour = kInactiveCardColor;
  Color femaleCardColour = kInactiveCardColor;
  void updateColour(Gender selectedgender){
    if(selectedgender==Gender.male){
      if(maleCardColour == kInactiveCardColor) {
        maleCardColour = kActiveCardColor;
        femaleCardColour=kInactiveCardColor;
      }
      else{
        maleCardColour= kInactiveCardColor;
      }
    }
    if(selectedgender==Gender.female){
      if(femaleCardColour== kInactiveCardColor){
        femaleCardColour= kActiveCardColor;
        maleCardColour=kInactiveCardColor;
      }
      else{
        femaleCardColour=kInactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: Row(
                children: [ Expanded(child:GestureDetector(
                  onTap: (){
                    setState(() {
                      updateColour(Gender.male);
                    });
                  },
                  child: ReusableCard(
                    colour: maleCardColour,
                    cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),
                  ),
                )),
                  Expanded(child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColour(Gender.female);
                      });
                    },
                    child: ReusableCard(
                      colour: femaleCardColour,
                      cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',),
                    ),
                  )),
                ]
            ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                            height.toString(),
                            style: kNumberTextStyle),
                        Text('cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor:Color(0xFFeb1555),
                        overlayColor: Color(0x15eb1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value : height.toDouble(),
                        min: 100.0,
                        max: 220.0,
                        activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });

                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(child:Row(
              children: [
                Expanded(child:ReusableCard( colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(icon :FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                ),
                Expanded(child:ReusableCard( colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(icon :FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )

                    ],
                  ),
                ),),
              ],
            )),
            bottomButton(
              bottomTitle: 'CALCULATE',
              ontap: (){
                CalculatorBrain calc = CalculatorBrain(weight: weight, height: height);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage (
                  bmiResult: calc.calculateBMI() ,
                  resulttext: calc.getResult() ,
                  interpretation: calc.getInterpretation(),
                ) ,

                ),
                );
              },
            )
          ],
        )
    );
  }
}





