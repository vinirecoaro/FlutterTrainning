import 'package:dio/dio.dart';
import 'package:trilhaapp/model/tasks_back4app_model.dart';

class TasksBack4appRepository {
  Future<TasksBack4appModel> obtainTasks() async {
    var dio = Dio();
    dio.options.headers["X-Parse-Application-Id"] =
        "a8Abz3RJduDcTab4fHVM0cfuMd2oKjY875TCE8SD";
    dio.options.headers["X-Parse-REST-API-Key"] =
        "zaJYWvWDakRzf7HPeX0baJG4FbA8anUHtRYrCCFB";
    dio.options.headers["Content-Type"] = "application/json";

    var result = await dio.get("https://parseapi.back4app.com/classes/Tasks");
    return TasksBack4appModel.fromJson(result.data);
  }
}
