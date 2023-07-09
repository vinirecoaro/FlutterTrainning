import 'package:dio/dio.dart';
import 'package:trilhaapp/model/tasks_back4app_model.dart';

class TasksBack4appRepository {
  var _dio = Dio();

  TasksBack4appRepository() {
    _dio = Dio();
    _dio.options.headers["X-Parse-Application-Id"] =
        "a8Abz3RJduDcTab4fHVM0cfuMd2oKjY875TCE8SD";
    _dio.options.headers["X-Parse-REST-API-Key"] =
        "zaJYWvWDakRzf7HPeX0baJG4FbA8anUHtRYrCCFB";
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.baseUrl = "https://parseapi.back4app.com/classes";
  }

  Future<TasksBack4appModel> obtainTasks(bool justNotConcluded) async {
    var url = "/Tasks";
    if (justNotConcluded) {
      url = '$url?where={"concluded":true}';
    }
    var result = await _dio.get(url);
    return TasksBack4appModel.fromJson(result.data);
  }

  Future<void> create(TaskBack4appModel taskBack4appModel) async {
    try {
      await _dio.post("/Tasks", data: taskBack4appModel.toCreateJson());
    } catch (e) {
      throw e;
    }
  }

  Future<void> update(TaskBack4appModel taskBack4appModel) async {
    try {
      await _dio.put("/Tasks/${taskBack4appModel.objectId}",
          data: taskBack4appModel.toJsonEndpoint());
    } catch (e) {
      throw e;
    }
  }

  Future<void> remove(String objectId) async {
    try {
      await _dio.delete("/Tasks/${objectId}");
    } catch (e) {
      throw e;
    }
  }
}
