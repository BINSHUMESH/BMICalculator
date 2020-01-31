import 'package:flutter/material.dart';
import 'constants.dart';
class ContainerChild extends StatelessWidget {
  final IconData iconType;
  final String gender;
  ContainerChild(this.iconType,this.gender);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconType,
          color: Colors.white,
          size: 80,
        ),
        SizedBox(height: 10,),
        Text(
          gender,
          style: tp
          )
      ],
    );
  }
}