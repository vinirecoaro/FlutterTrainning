// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:trilhaapp/model/task_hive_model.dart';
import 'package:trilhaapp/repositories/task_hive_repository.dart';

class TaskHivePage extends StatefulWidget {
  const TaskHivePage({super.key});

  @override
  State<TaskHivePage> createState() => _TaskHivePageState();
}

class _TaskHivePageState extends State<TaskHivePage> {
  var _tasks = const <TaskHiveModel>[];
  var descriptionController = TextEditingController();
  var justNotConcluded = false;

  late TaskHiveRepository taskRepository;

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  void getTasks() async {
    taskRepository = await TaskHiveRepository.load();
    _tasks = taskRepository.obtainData(justNotConcluded);
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
                          await taskRepository.save(TaskHiveModel.create(
                              descriptionController.text, false));
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
                        await taskRepository.delete(task);
                        getTasks();
                      },
                      key: Key(task.description),
                      child: ListTile(
                        title: Text(task.description),
                        trailing: Switch(
                          onChanged: (bool value) async {
                            task.concluded = value;
                            taskRepository.change(task);
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
