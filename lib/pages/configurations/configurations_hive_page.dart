import 'package:flutter/material.dart';
import 'package:trilhaapp/model/condigurations_model.dart';
import 'package:trilhaapp/repositories/configurations_repository.dart';
import 'package:trilhaapp/service/app_storage_serveice.dart';

class ConfigurationsHivePage extends StatefulWidget {
  const ConfigurationsHivePage({super.key});

  @override
  State<ConfigurationsHivePage> createState() => _ConfigurationsHivePageState();
}

class _ConfigurationsHivePageState extends State<ConfigurationsHivePage> {
  late ConfigurationRepository configurationRepository;
  var configurationsModel = ConfigurationsModel.vazio();

  TextEditingController userNameController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    configurationRepository = await ConfigurationRepository.load();
    configurationsModel = configurationRepository.obtainData();
    userNameController.text = configurationsModel.userName;
    heightController.text = configurationsModel.height.toString();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Configurações Hive"),
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: const InputDecoration(hintText: "Nome usuário"),
                controller: userNameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: "Altura"),
                controller: heightController,
              ),
            ),
            SwitchListTile(
                title: const Text("Receber Notificações"),
                value: configurationsModel.receivePullNotification,
                onChanged: (bool value) {
                  setState(() {
                    configurationsModel.receivePullNotification = value;
                  });
                }),
            SwitchListTile(
                title: const Text("Tema Escuro"),
                value: configurationsModel.darkTheme,
                onChanged: (bool value) {
                  setState(() {
                    configurationsModel.darkTheme = value;
                  });
                }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextButton(
                  onPressed: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    try {
                      configurationsModel.height =
                          double.parse(heightController.text);
                    } catch (e) {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: const Text("Meu APP"),
                              content: const Text(
                                  "Favor informar uma altura válida"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Ok"))
                              ],
                            );
                          });
                      return;
                    }
                    configurationsModel.userName = userNameController.text;
                    configurationRepository.save(configurationsModel);
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  child: const Text(
                    "Salvar",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
