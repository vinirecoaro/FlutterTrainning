import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigurationsPage extends StatefulWidget {
  const ConfigurationsPage({super.key});

  @override
  State<ConfigurationsPage> createState() => _ConfigurationsPageState();
}

class _ConfigurationsPageState extends State<ConfigurationsPage> {
  late SharedPreferences storage;

  TextEditingController userNameController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String? usarName;
  double? height;
  bool receivePushNotification = false;
  bool darkTheme = false;

  final USER_NAME_KEY = "user_name_key";
  final HEIGHT_KEY = "height_key";
  final RECEIVE_PULL_NOTIFICATION_KEY = "receive_pull_notification_key";
  final DARK_THEME_KEY = "dark_theme_key";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      userNameController.text = storage.getString(USER_NAME_KEY) ?? "";
      heightController.text = (storage.getDouble(HEIGHT_KEY) ?? 0).toString();
      receivePushNotification =
          storage.getBool(RECEIVE_PULL_NOTIFICATION_KEY) ?? false;
      darkTheme = storage.getBool(DARK_THEME_KEY) ?? false;
    });
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
                      await storage.setDouble(
                          HEIGHT_KEY, double.parse(heightController.text));
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
                    await storage.setString(
                        USER_NAME_KEY, userNameController.text);

                    await storage.setBool(
                        RECEIVE_PULL_NOTIFICATION_KEY, receivePushNotification);
                    await storage.setBool(DARK_THEME_KEY, darkTheme);
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
