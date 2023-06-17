import '../model/task.dart';

class TaskRepository {
  final List<Task> _tasks = [];

  Future<void> addTask(Task task) async {
    await Future.delayed(const Duration(microseconds: 100));
    _tasks.add(task);
  }

  Future<void> changeTask(String id, bool concluded) async {
    await Future.delayed(const Duration(microseconds: 100));
    _tasks.where((task) => task.id == id).first.concluded = concluded;
  }

  Future<void> removeTask(String id) async {
    await Future.delayed(const Duration(microseconds: 100));
    _tasks.remove(_tasks.where((element) => element.id == id).first);
  }

  Future<List<Task>> returnTaskList() async {
    await Future.delayed(const Duration(microseconds: 100));
    return _tasks;
  }

  Future<List<Task>> returnNotConcludedTasks() async {
    await Future.delayed(const Duration(microseconds: 100));
    return _tasks.where((task) => !task.concluded).toList();
  }
}
