// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:trilhaapp/model/task_hive_model.dart';
import 'package:trilhaapp/model/task_sqlite_model.dart';
import 'package:trilhaapp/repositories/sqlite/task_sqlite_repository.dart';
import 'package:trilhaapp/repositories/task_hive_repository.dart';

class TaskSQlitePage extends StatefulWidget {
  const TaskSQlitePage({super.key});

  @override
  State<TaskSQlitePage> createState() => _TaskSQlitePageState();
}

class _TaskSQlitePageState extends State<TaskSQlitePage> {
  var _tasks = const <TaskSQLiteModel>[];
  var descriptionController = TextEditingController();
  var justNotConcluded = false;

  TaskSQLiteRepository taskRepository = TaskSQLiteRepository();

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  void getTasks() async {
    _tasks = await taskRepository.obtainData(justNotConcluded);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          descriptionController.text = "";
          showDialog(
              context: context,
              builder: (BuildContext bc) {
                return AlertDialog(
                  title: const Text("Adicionar Tarefa"),
                  content: TextField(
                    controller: descriptionController,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancelar")),
                    TextButton(
                        onPressed: () async {
                          await taskRepository.save(TaskSQLiteModel(
                              0, descriptionController.text, false));
                          Navigator.pop(context);
                          getTasks();
                          setState(() {});
                        },
                        child: const Text("Salvar"))
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Apenas não concluidos",
                    style: TextStyle(fontSize: 18),
                  ),
                  Switch(
                      value: justNotConcluded,
                      onChanged: (bool value) {
                        justNotConcluded = value;
                        getTasks();
                        setState(() {});
                      })
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _tasks.length,
                  itemBuilder: (BuildContext bc, int index) {
                    var task = _tasks[index];
                    return Dismissible(
                      onDismissed: (DismissDirection dismissDirection) async {
                        await taskRepository.remove(task.id);
                        getTasks();
                      },
                      key: Key(task.description),
                      child: ListTile(
                        title: Text(task.description),
                        trailing: Switch(
                          onChanged: (bool value) async {
                            task.concluded = value;
                            taskRepository.update(task);
                            getTasks();
                          },
                          value: task.concluded,
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
