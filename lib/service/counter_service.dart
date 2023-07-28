import 'package:flutter/material.dart';

class CounterService extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
  void increment() {
    _counter = _counter + 1;
    notifyListeners();
  }
}
