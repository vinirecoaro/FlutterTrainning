class TaskSQLiteModel {
  int _id = 0;
  String _description = "";
  bool _concluded = false;

  TaskSQLiteModel(this._id, this._description, this._concluded);

  int get id => _id;
  String get description => _description;
  bool get concluded => _concluded;

  set id(int id) {
    _id = id;
  }

  set description(String description) {
    _description = description;
  }

  set concluded(bool concluded) {
    _concluded = concluded;
  }
}
