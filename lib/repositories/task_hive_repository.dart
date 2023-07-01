import 'package:hive/hive.dart';
import 'package:trilhaapp/model/task_hive_model.dart';

class TaskHiveRepository {
  static late Box _box;

  TaskHiveRepository._create();

  static Future<TaskHiveRepository> load() async {
    if (Hive.isBoxOpen("task_model")) {
      _box = Hive.box("task_model");
    } else {
      _box = await Hive.openBox("task_model");
    }
    return TaskHiveRepository._create();
  }

  save(TaskHiveModel taskHiveModel) {
    _box.add(taskHiveModel);
  }

  change(TaskHiveModel taskHiveModel) {
    taskHiveModel.save();
  }

  delete(TaskHiveModel taskHiveModel) {
    taskHiveModel.delete();
  }

  List<TaskHiveModel> obtainData(bool notConcluded) {
    if (notConcluded) {
      return _box.values
          .cast<TaskHiveModel>()
          .where((element) => !element.concluded)
          .toList();
    }
    return _box.values.cast<TaskHiveModel>().toList();
  }
}
