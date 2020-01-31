import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'CustomButton.dart';
import 'ReusableCard.dart';
import 'package:bmi_calculator/Icondata.dart';
import 'constants.dart';
import 'ResultScreen.dart';
import 'CalculatorBrain.dart';
void main() => runApp(BMICalculator());

enum gender{
  male,
  female,
}
class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0XFF0A0E21),
        scaffoldBackgroundColor: Color(0XFF0A0E21),
        accentColor: Colors.purple,
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.white),
        ),
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor=inActiveColor;
  Color femaleCardColor=activeColor;
  int height=180;
  int weight=68;
  int age=19;
  void updateColor(gender g){
      g==gender.male?maleCardColor=activeColor:femaleCardColor=activeColor;
      g==gender.male?femaleCardColor=inActiveColor:maleCardColor=inActiveColor;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    maleCardColor,
                    ContainerChild(FontAwesomeIcons.male,'MALE'),
                    (){
                      setState(() {
                        updateColor(gender.male);
                      });
                    }
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                      femaleCardColor,
                      ContainerChild(FontAwesomeIcons.female,'FEMALE'),
                      (){
                      setState(() {
                      updateColor(gender.female);
                      });
                      }
                    ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(activeColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT',style: tp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(),style: bodyValues,),
                        Text('cm',style: tp,)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFEB1555),
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30)
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        onChanged: (double newValue){
                          setState(() {
                            height=newValue.round();
                          });
                        },
                        min: 120,
                        max: 220,
                      ),
                    )
                  ],
                ),
                null),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(activeColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('WEIGHT',style: tp,),
                          Text(weight.toString(),style: bodyValues,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(FontAwesomeIcons.plus,(){
                                setState(() {
                                  weight=weight+1;
                                });
                              }),
                              SizedBox(width: 10,),
                              RoundIconButton(FontAwesomeIcons.minus,(){
                                setState(() {
                                  weight=weight-1;
                                });
                              }),
                            ],
                          ),
                        ],
                      ),
                      null),
                ),
                Expanded(
                  child: ReusableCard(activeColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('AGE',style: tp,),
                          Text(age.toString(),style: bodyValues,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(FontAwesomeIcons.plus,(){
                                setState(() {
                                  age=age+1;
                                });
                              }),
                              SizedBox(width: 10,),
                              RoundIconButton(FontAwesomeIcons.minus,(){
                                setState(() {
                                  age=age-1;
                                });
                              }),
                            ],
                          ),
                        ],
                      ),
                      null),
                ),
              ],
            ),
          ),
          CustomButton((){
            CalculatorBrain calculate=CalculatorBrain(height, weight);
            String result=calculate.getResult();
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>Result(calculate.getStatus(),result,calculate.getDescription()))
            );
          },'CALCULATE'
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final Function data;
  RoundIconButton(this.icon,this.data);
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
      onPressed: data,
      shape: CircleBorder(),
      child: Icon(icon,color: Colors.white,),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}


