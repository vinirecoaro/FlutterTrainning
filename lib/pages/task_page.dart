// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/task_repository.dart';

import '../model/task.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  var _tasks = const <Task>[];
  var descriptionController = TextEditingController();
  var taskRepository = TaskRepository();
  var justNotConcluded = false;

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  void getTasks() async {
    if (justNotConcluded) {
      _tasks = await taskRepository.returnNotConcludedTasks();
    } else {
      _tasks = await taskRepository.returnTaskList();
    }
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
                          await taskRepository
                              .addTask(Task(descriptionController.text, false));
                          Navigator.pop(context);
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
                        await taskRepository.removeTask(task.id);
                        getTasks();
                      },
                      key: Key(task.id),
                      child: ListTile(
                        title: Text(task.description),
                        trailing: Switch(
                          onChanged: (bool value) async {
                            await taskRepository.changeTask(task.id, value);
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
