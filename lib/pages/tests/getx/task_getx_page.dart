import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trilhaapp/service/task_list_controller.dart';

class TaskGetXPage extends StatelessWidget {
  var descriptionController = TextEditingController();
  var taskListController = TaskListController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            descriptionController.text = "";
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: const Text("Adicionar tarefa"),
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
                            taskListController.add(descriptionController.text);
                            Navigator.pop(context);
                          },
                          child: const Text("Salvar"))
                    ],
                  );
                });
          },
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              const Text(
                "Tarefas GetX Store",
                style: TextStyle(fontSize: 26),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Apenas não concluídos",
                      style: TextStyle(fontSize: 18),
                    ),
                    Obx(() {
                      return Switch(
                          value: taskListController.justNotConcluded,
                          onChanged: taskListController.setJustNotConcluded);
                    })
                  ],
                ),
              ),
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                      itemCount: taskListController.tasks.length,
                      itemBuilder: (BuildContext bc, int index) {
                        var task = taskListController.tasks[index];
                        return Dismissible(
                          onDismissed:
                              (DismissDirection dismissDirection) async {
                            taskListController.delete(task.id);
                          },
                          key: Key(task.description),
                          child: ListTile(
                            title: Text(task.description),
                            trailing: Switch(
                              onChanged: (bool value) async {
                                task.concluded = value;
                                taskListController.change(
                                    task.id, task.description, task.concluded);
                              },
                              value: task.concluded,
                            ),
                          ),
                        );
                      });
                }),
              ),
            ],
          ),
        ));
  }
}
