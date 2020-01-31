import 'dart:math';
class CalculatorBrain{
  final int height,weight;
  CalculatorBrain(this.height,this.weight);
  double _bmi;
  String getResult(){
    _bmi=weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }
  String getStatus(){
    if(_bmi<18.5){
      return 'UNDERWEIGHT';
    }else if(_bmi<22){
      return 'NORMAL';
    }else return 'OVERWEIGHT';
  }
  String getDescription(){
    if(_bmi<18.5){
      return 'You have a lower than normal Body weight. Try to eat more.';
    }else if(_bmi<22){
      return 'You have a normal Body Weight.Keep it Up!';
    }else return 'You have a higher than normal Body weight. Try to exercise more.';
  }
}