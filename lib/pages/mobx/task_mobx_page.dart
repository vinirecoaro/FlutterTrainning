import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trilhaapp/model/task_list_store.dart';

class TaskMobXPage extends StatelessWidget {
  var descriptionController = TextEditingController();
  var taskListStore = TaskListStore();

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
                            taskListStore.add(descriptionController.text);
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
                "Tarefas MobX Store",
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
                    Observer(builder: (_) {
                      return Switch(
                          value: taskListStore.justNotconcluded,
                          onChanged: taskListStore.setNotconcluded);
                    })
                  ],
                ),
              ),
              Expanded(
                child: Observer(builder: (context) {
                  return ListView.builder(
                      itemCount: taskListStore.tasks.length,
                      itemBuilder: (BuildContext bc, int index) {
                        var task = taskListStore.tasks[index];
                        return Observer(builder: (_) {
                          return Dismissible(
                            onDismissed:
                                (DismissDirection dismissDirection) async {
                              taskListStore.delete(task.id);
                            },
                            key: Key(task.description),
                            child: ListTile(
                              title: Text(task.description),
                              trailing: Switch(
                                onChanged: (bool value) async {
                                  task.concluded = value;
                                  taskListStore.change(task.id,
                                      task.description, task.concluded);
                                },
                                value: task.concluded,
                              ),
                            ),
                          );
                        });
                      });
                }),
              ),
            ],
          ),
        ));
  }
}
