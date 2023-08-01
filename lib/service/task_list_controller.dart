import 'package:get/get.dart';
import 'package:trilhaapp/model/task.dart';

class TaskListController extends GetxController {
  var _justNotConcluded = false.obs;

  bool get justNotConcluded => _justNotConcluded.value;

  void setJustNotConcluded(bool value) {
    _justNotConcluded.value = value;
  }

  RxList<Task> _tasks = <Task>[].obs;

  List<Task> get tasks => _justNotConcluded.value
      ? _tasks.where((element) => !element.concluded).toList().obs
      : _tasks.toList().obs;

  add(String description) {
    _tasks.add(Task(description, false));
  }

  delete(String id) {
    _tasks.removeWhere((element) => element.id == id);
  }

  change(String id, String description, bool concluded) {
    var task = _tasks.firstWhere((element) => element.id == id);
    task.description = description;
    task.concluded = concluded;
    _tasks.refresh();
  }
}
