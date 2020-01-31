import 'package:flutter/material.dart';
import 'constants.dart';
class CustomButton extends StatelessWidget {
  final Function onClick;
  final String buttonText;
  CustomButton(this.onClick,this.buttonText);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        child: Center(
          child: Text(
            buttonText,
            style: buttonStyle,
          ),
        ),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: bottomBoxHeight,
        color: Color(0xFFEB1555),
      ),
    );
  }
}