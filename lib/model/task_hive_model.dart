import 'package:hive/hive.dart';
part 'task_hive_model.g.dart';

@HiveType(typeId: 1)
class TaskHiveModel extends HiveObject {
  @HiveField(0)
  String description = "";

  @HiveField(1)
  bool concluded = false;

  TaskHiveModel();

  TaskHiveModel.create(this.description, this.concluded);
}
