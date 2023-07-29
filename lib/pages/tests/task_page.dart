import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskPage2 extends StatefulWidget {
  const TaskPage2({super.key});

  @override
  State<TaskPage2> createState() => _TaskPage2State();
}

class _TaskPage2State extends State<TaskPage2> {
  var _tasks = [];
  var descriptionController = TextEditingController();
  var justNotConcluded = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() {
    setState(() {});
  }

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
                            Provider.of<TarefaRepository>(context,
                                    listen: false)
                                .adicionar(
                                    Tarefa(descricaoContoller.text, false));
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
                    Consumer<TarefaRepository>(
                        builder: (_, tarefaRepository, Widget) {
                      return Switch(
                          value: tarefaRepository.apenasNaoConcluidos,
                          onChanged: (bool value) {
                            Provider.of<TarefaRepository>(context,
                                    listen: false)
                                .apenasNaoConcluidos = value;
                          });
                    })
                  ],
                ),
              ),
              Expanded(
                child: Consumer<TarefaRepository>(
                    builder: (_, tarefaRepository, Widget) {
                  return ListView.builder(
                      itemCount: tarefaRepository.tarefas.length,
                      itemBuilder: (BuildContext bc, int index) {
                        var tarefa = tarefaRepository.tarefas[index];
                        return Dismissible(
                          onDismissed:
                              (DismissDirection dismissDirection) async {
                            Provider.of<TarefaRepository>(context,
                                    listen: false)
                                .remover(tarefa.id);
                          },
                          key: Key(tarefa.descricao),
                          child: ListTile(
                            title: Text(tarefa.descricao),
                            trailing: Switch(
                              onChanged: (bool value) async {
                                tarefa.concluido = value;
                                Provider.of<TarefaRepository>(context,
                                        listen: false)
                                    .alterar(tarefa.id, tarefa.concluido);
                              },
                              value: tarefa.concluido,
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
