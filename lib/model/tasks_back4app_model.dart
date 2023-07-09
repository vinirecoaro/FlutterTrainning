class TasksBack4appModel {
  List<TaskBack4appModel> tasks = [];

  TasksBack4appModel(this.tasks);

  TasksBack4appModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      tasks = <TaskBack4appModel>[];
      json['results'].forEach((v) {
        tasks.add(TaskBack4appModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = tasks.map((v) => v.toJson()).toList();
    return data;
  }
}

class TaskBack4appModel {
  String objectId = "";
  String description = "";
  bool concluded = false;
  String createdAt = "";
  String updatedAt = "";

  TaskBack4appModel(this.objectId, this.description, this.concluded,
      this.createdAt, this.updatedAt);

  TaskBack4appModel.create(
    this.description,
    this.concluded,
  );

  TaskBack4appModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    description = json['description'];
    concluded = json['concluded'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['description'] = description;
    data['concluded'] = concluded;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

  Map<String, dynamic> toCreateJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['concluded'] = concluded;
    return data;
  }

  Map<String, dynamic> toJsonEndpoint() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['concluded'] = concluded;
    return data;
  }
}
