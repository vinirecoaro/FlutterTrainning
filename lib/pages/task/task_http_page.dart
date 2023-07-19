// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:trilhaapp/model/tasks_back4app_model.dart';
import 'package:trilhaapp/repositories/back4app/tasks_back4app_repository.dart';

class TaskHttpPage extends StatefulWidget {
  const TaskHttpPage({super.key});

  @override
  State<TaskHttpPage> createState() => _TaskHttpPageState();
}

class _TaskHttpPageState extends State<TaskHttpPage> {
  var _tasksBack4app = TasksBack4appModel([]);
  var descriptionController = TextEditingController();
  var justNotConcluded = false;

  TasksBack4appRepository taskRepository = TasksBack4appRepository();

  var loading = false;

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  void getTasks() async {
    setState(() {
      loading = true;
    });
    _tasksBack4app = await taskRepository.obtainTasks(justNotConcluded);
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tarefas HTTP")),
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
                          await taskRepository.create(TaskBack4appModel.create(
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
            loading
                ? const CircularProgressIndicator()
                : Expanded(
                    child: ListView.builder(
                        itemCount: _tasksBack4app.tasks.length,
                        itemBuilder: (BuildContext bc, int index) {
                          var task = _tasksBack4app.tasks[index];
                          return Dismissible(
                            onDismissed:
                                (DismissDirection dismissDirection) async {
                              await taskRepository.remove(task.objectId);
                              getTasks();
                            },
                            key: Key(task.description),
                            child: ListTile(
                              title: Text(task.description),
                              trailing: Switch(
                                onChanged: (bool value) async {
                                  task.concluded = value;
                                  await taskRepository.update(task);
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
