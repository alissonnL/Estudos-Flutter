import 'dart:math';

class Dice{
  int _num = 1;

  int getNum(){
    return _num;
  }

  void jogarDado(){
    var rnd = Random();
    _num = rnd.nextInt(6) + 1;
  }
}