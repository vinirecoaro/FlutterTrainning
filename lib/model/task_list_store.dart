import 'package:mobx/mobx.dart';
import 'package:trilhaapp/model/task_mobx_model.dart';

// Include generated file
part 'task_list_store.g.dart';

// This is the class used by rest of your codebase
class TaskListStore = _TaskListStore with _$TaskListStore;

abstract class _TaskListStore with Store {
  ObservableList<TaskStore> tasks = ObservableList<TaskStore>();

  @action
  void add(String description) {
    tasks.add(TaskStore(description, false));
  }

  @action
  void change(String id, String description, bool concluded) {
    var task = tasks.firstWhere((element) => element.id == id);
    task.change(description, concluded);
  }

  @action
  void delete(String id) {
    tasks.removeWhere((element) => element.id == id);
  }
}
