import 'package:trilhaapp/model/tasks_back4app_model.dart';
import 'package:trilhaapp/repositories/back4app/back4app_custon_dio.dart';

class TasksBack4appRepository {
  final _custonDio = Back4appCutonDio();

  TasksBack4appRepository();

  Future<TasksBack4appModel> obtainTasks(bool justNotConcluded) async {
    var url = "/Tasks";
    if (justNotConcluded) {
      url = '$url?where={"concluded":true}';
    }
    var result = await _custonDio.dio.get(url);
    return TasksBack4appModel.fromJson(result.data);
  }

  Future<void> create(TaskBack4appModel taskBack4appModel) async {
    try {
      await _custonDio.dio
          .post("/Tasks", data: taskBack4appModel.toCreateJson());
    } catch (e) {
      throw e;
    }
  }

  Future<void> update(TaskBack4appModel taskBack4appModel) async {
    try {
      await _custonDio.dio.put("/Tasks/${taskBack4appModel.objectId}",
          data: taskBack4appModel.toJsonEndpoint());
    } catch (e) {
      throw e;
    }
  }

  Future<void> remove(String objectId) async {
    try {
      await _custonDio.dio.delete("/Tasks/${objectId}");
    } catch (e) {
      throw e;
    }
  }
}
