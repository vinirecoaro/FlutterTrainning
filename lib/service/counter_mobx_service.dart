import 'package:mobx/mobx.dart';

class CounterMobXService {
  final _counter = Observable(0);
  int get counter => _counter.value;

  late Action increment;

  set counter(int newValue) => _counter.value = newValue;

  void _increment() {
    _counter.value++;
  }

  CounterMobXService() {
    increment = Action(_increment);
  }
}
