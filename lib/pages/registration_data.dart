import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/languages_repository.dart';
import 'package:trilhaapp/repositories/level_repository.dart';
import 'package:trilhaapp/shared/widgets/text_label.dart';

class RegistrationDataPage extends StatefulWidget {
  const RegistrationDataPage({super.key});

  @override
  State<RegistrationDataPage> createState() => _RegistrationDataPageState();
}

class _RegistrationDataPageState extends State<RegistrationDataPage> {
  var nameController = TextEditingController(text: "");
  var birthdayController = TextEditingController(text: "");
  DateTime? birthday;
  var levelRepository = LevelRepository();
  var levels = [];
  var selectedLevel = "";
  var languagesRepository = LanguagesRepository();
  var languages = [];
  var selectedLanguage = [];

  @override
  void initState() {
    levels = levelRepository.returnLevels();
    languages = languagesRepository.returnLanguages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Meus Dados"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: ListView(
            children: [
              const TextLabel(text: "Nome"),
              TextField(
                controller: nameController,
              ),
              const TextLabel(text: "Data de Nascimento"),
              TextField(
                controller: birthdayController,
                readOnly: true,
                onTap: () async {
                  var date = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000, 1, 1),
                      firstDate: DateTime(1900, 1, 1),
                      lastDate: DateTime(2023, 10, 23));
                  if (date != null) {
                    birthdayController.text = date.toString();
                    birthday = date;
                  }
                },
              ),
              const TextLabel(text: "Nivel de experiência"),
              Column(
                children: levels
                    .map((level) => RadioListTile(
                        title: Text(level),
                        selected: selectedLevel == level,
                        value: level,
                        groupValue: selectedLevel,
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            selectedLevel = value;
                          });
                        }))
                    .toList(),
              ),
              const TextLabel(text: "Linguagens preferidas"),
              Column(
                children: languages
                    .map((language) => CheckboxListTile(
                        dense: true,
                        title: Text(language),
                        value: selectedLanguage.contains(language),
                        onChanged: (bool? value) {
                          if (value!) {
                            setState(() {
                              selectedLanguage.add(language);
                            });
                          } else {
                            setState(() {
                              selectedLanguage.remove(language);
                            });
                          }
                        }))
                    .toList(),
              ),
              TextButton(
                onPressed: () {
                  debugPrint(nameController.text);
                  debugPrint(birthday.toString());
                },
                child: const Text("Salvar"),
              )
            ],
          ),
        ));
  }
}
