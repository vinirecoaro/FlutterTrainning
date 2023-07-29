import 'package:flutter/material.dart';
import 'package:trilhaapp/model/task.dart';

class TaskProviderRepository extends ChangeNotifier {
  final _tasks = <Task>[];
  var _justNotConcluded = false;

  set justNotConcluded(bool value) {
    _justNotConcluded = value;
    notifyListeners();
  }

  bool get justNotConcluded => _justNotConcluded;

  get tasks => _justNotConcluded
      ? _tasks.where((element) => !element.concluded).toList()
      : _tasks;

  add(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  change(String id, bool concluded) {
    _tasks.where((element) => element.id == id).first.concluded = concluded;
    notifyListeners();
  }

  remove(String id) {
    _tasks.remove(_tasks.where((element) => element.id == id).first);
    notifyListeners();
  }
}
