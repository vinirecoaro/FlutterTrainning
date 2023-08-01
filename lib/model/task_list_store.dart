import 'package:mobx/mobx.dart';
import 'package:trilhaapp/model/task_mobx_model.dart';

// Include generated file
part 'task_list_store.g.dart';

// This is the class used by rest of your codebase
class TaskListStore = _TaskListStore with _$TaskListStore;

abstract class _TaskListStore with Store {
  ObservableList<TaskStore> _tasks = ObservableList<TaskStore>();

  @computed
  List<TaskStore> get tasks => justNotconcluded
      ? _tasks.where((element) => !element.concluded).toList()
      : _tasks.toList();

  @observable
  var _justNotconcluded = Observable(false);

  @action
  void setNotconcluded(bool value) {
    _justNotconcluded.value = value;
  }

  bool get justNotconcluded => _justNotconcluded.value;

  @action
  void add(String description) {
    _tasks.add(TaskStore(description, false));
  }

  @action
  void change(String id, String description, bool concluded) {
    var task = _tasks.firstWhere((element) => element.id == id);
    task.change(description, concluded);
  }

  @action
  void delete(String id) {
    _tasks.removeWhere((element) => element.id == id);
  }
}
