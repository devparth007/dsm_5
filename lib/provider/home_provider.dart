import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeProvider with ChangeNotifier {
  int _countWeight = 0;
  int _countHeight = 0;
  int _countAge = 0;
  bool _backArrow = false;
  final List _result = [];

  int get countWeight => _countWeight;
  int get countHeight => _countHeight;
  int get countAge => _countAge;
  bool get backArrow => _backArrow;
  List get result => _result;

  incrementWeight() {
    _countWeight++;
    notifyListeners();
  }

  decrementWeight() {
    _countWeight--;
    notifyListeners();
  }

  incrementHeight() {
    _countHeight++;
    notifyListeners();
  }

  decrementHeight() {
    _countHeight--;
    notifyListeners();
  }

  incrementAge() {
    _countAge++;
    notifyListeners();
  }

  decrementAge() {
    _countAge--;
    notifyListeners();
  }

  void arrowVisible() {
    _backArrow = false;
    notifyListeners();
  }

  void arrowNotVisible() {
    _backArrow = true;
    notifyListeners();
  }

  addToList({
    required value,
  }) {
    if (value == 1) {
      _result.add('1');
    }
    if (value == 2) {
      _result.add('2');
    }
    if (value == 3) {
      _result.add('3');
    }
    if (value == 4) {
      _result.add('4');
    }
  }
}
