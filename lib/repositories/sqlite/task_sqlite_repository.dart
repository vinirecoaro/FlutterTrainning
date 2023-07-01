import 'package:trilhaapp/model/task_sqlite_model.dart';
import 'package:trilhaapp/repositories/sqlite/sqlite_database.dart';

class TaskSQLiteRepository {
  Future<List<TaskSQLiteModel>> obtainData(bool justNotConcluded) async {
    List<TaskSQLiteModel> tasks = [];
    var db = await SQLiteDataBase().getDatabase();
    var result = await db.rawQuery(justNotConcluded
        ? "SELECT id, description, concluded FROM tasks WHERE concluded = 0"
        : 'SELECT id, description, concluded FROM tasks');
    for (var element in result) {
      tasks.add(TaskSQLiteModel(int.parse(element['id'].toString()),
          element['description'].toString(), element['concluded'] == 1));
    }

    return tasks;
  }

  Future<void> save(TaskSQLiteModel taskSQLiteModel) async {
    var db = await SQLiteDataBase().getDatabase();
    await db.rawInsert('INSERT INTO tasks (description, concluded) values(?,?)',
        [taskSQLiteModel.description, taskSQLiteModel.concluded]);
  }

  Future<void> update(TaskSQLiteModel taskSQLiteModel) async {
    var db = await SQLiteDataBase().getDatabase();
    await db.rawInsert(
        'UPDATE tasks SET description = ?, concluded = ? WHERE id = ?', [
      taskSQLiteModel.description,
      taskSQLiteModel.concluded,
      taskSQLiteModel.id
    ]);
  }

  Future<void> remove(int id) async {
    var db = await SQLiteDataBase().getDatabase();
    await db.rawInsert('DELETE FROM tasks WHERE id = ?', [id]);
  }
}
