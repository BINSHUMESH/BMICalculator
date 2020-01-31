import 'package:flutter/material.dart';
import 'constants.dart';
import 'ReusableCard.dart';
import 'CustomButton.dart';

class Result extends StatelessWidget {
  final String status,bmi,descriptionText;
  Result(this.status,this.bmi,this.descriptionText);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Your Result',
            style: resultStyle,
          ),
          Expanded(
            child: ReusableCard(
                activeColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      status,
                      style: categoryStyle,
                    ),
                    Text(
                      bmi,
                      style: bmTextStyle
                    ),
                    Text(
                      descriptionText,
                      style: description,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                null),
          ),
          CustomButton(() {
            Navigator.pop(context);
          }, 'RE-CALCULATE')
        ],
      ),
    );
  }
}
