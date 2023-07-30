import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trilhaapp/model/task.dart';
import '../../../repositories/task_repository_provider.dart';

class TaskProviderPage extends StatelessWidget {
  var descriptionController = TextEditingController();

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
                            Provider.of<TaskProviderRepository>(context,
                                    listen: false)
                                .add(Task(descriptionController.text, false));
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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Apenas não concluídos",
                      style: TextStyle(fontSize: 18),
                    ),
                    Consumer<TaskProviderRepository>(
                        builder: (_, taskProviderRepository, Widget) {
                      return Switch(
                          value: taskProviderRepository.justNotConcluded,
                          onChanged: (bool value) {
                            Provider.of<TaskProviderRepository>(context,
                                    listen: false)
                                .justNotConcluded = value;
                          });
                    })
                  ],
                ),
              ),
              Expanded(
                child: Consumer<TaskProviderRepository>(
                    builder: (_, tarefaRepository, Widget) {
                  return ListView.builder(
                      itemCount: tarefaRepository.tasks.length,
                      itemBuilder: (BuildContext bc, int index) {
                        var task = tarefaRepository.tasks[index];
                        return Dismissible(
                          onDismissed:
                              (DismissDirection dismissDirection) async {
                            Provider.of<TaskProviderRepository>(context,
                                    listen: false)
                                .remove(task.id);
                          },
                          key: Key(task.description),
                          child: ListTile(
                            title: Text(task.description),
                            trailing: Switch(
                              onChanged: (bool value) async {
                                task.concluded = value;
                                Provider.of<TaskProviderRepository>(context,
                                        listen: false)
                                    .change(task.id, task.concluded);
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
