import 'package:flutter/material.dart';
import 'package:trilhaapp/service/app_storage_serveice.dart';

class ConfigurationsPage extends StatefulWidget {
  const ConfigurationsPage({super.key});

  @override
  State<ConfigurationsPage> createState() => _ConfigurationsPageState();
}

class _ConfigurationsPageState extends State<ConfigurationsPage> {
  AppStorageService storage = AppStorageService();

  TextEditingController userNameController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String? usarName;
  double? height;
  bool receivePushNotification = false;
  bool darkTheme = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    userNameController.text = await storage.getConfigurationsName();
    heightController.text =
        (await (storage.getConfigurationsHeight())).toString();
    receivePushNotification =
        await storage.getConfigurationsReceivePullNotification();
    darkTheme = await storage.getConfigurationsDarkTheme();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
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
                value: receivePushNotification,
                onChanged: (bool value) {
                  setState(() {
                    receivePushNotification = !receivePushNotification;
                  });
                }),
            SwitchListTile(
                title: const Text("Tema Escuro"),
                value: darkTheme,
                onChanged: (bool value) {
                  setState(() {
                    darkTheme = !darkTheme;
                  });
                }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextButton(
                  onPressed: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    try {
                      await storage.setConfigurationsHeight(
                          double.parse(heightController.text));
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
                    await storage
                        .setConfigurationsName(userNameController.text);
                    await storage.setConfigurationsReceivePullNotification(
                        receivePushNotification);
                    await storage.setConfigurationsDarkTheme(darkTheme);
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
