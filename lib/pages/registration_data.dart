import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/languages_repository.dart';
import 'package:trilhaapp/repositories/level_repository.dart';
import 'package:trilhaapp/service/app_storage_serveice.dart';
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
  List<String> selectedLanguage = [];
  double selectedSalary = 0;
  int experienceTime = 0;

  bool saving = false;

  AppStorageService storage = AppStorageService();

  @override
  void initState() {
    levels = levelRepository.returnLevels();
    languages = languagesRepository.returnLanguages();
    super.initState();
    loadData();
  }

  void loadData() async {
    nameController.text = await storage.getRegistrationDataName();
    birthdayController.text = await storage.getRegistrationDataBirthday();
    birthday = DateTime.parse(birthdayController.text);
    selectedLevel = await storage.getRegistrationDataExperienceLevel();
    selectedLanguage = await storage.getRegistrationDataLanguages();
    experienceTime = await storage.getRegistrationDataExperienceTime();
    selectedSalary = await storage.getRegistrationDataSalary();
    setState(() {});
  }

  List<DropdownMenuItem> returnItens(int maxValue) {
    var itens = <DropdownMenuItem>[];
    for (var i = 0; i <= maxValue; i++) {
      itens.add(DropdownMenuItem(
        value: i,
        child: Text(i.toString()),
      ));
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Meus Dados"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: saving
              ? const Center(child: CircularProgressIndicator())
              : ListView(
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
                                debugPrint(value);
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
                    const TextLabel(text: "Tempo de experiencia"),
                    DropdownButton(
                        value: experienceTime,
                        isExpanded: true,
                        items: returnItens(50),
                        onChanged: (value) {
                          setState(() {
                            experienceTime = int.parse(value.toString());
                          });
                        }),
                    TextLabel(
                        text:
                            "Pretenção salarial. R\$ ${selectedSalary.round().toString()}"),
                    Slider(
                        min: 0,
                        max: 10000,
                        value: selectedSalary,
                        onChanged: (double value) {
                          setState(() {
                            selectedSalary = value;
                          });
                        }),
                    TextButton(
                      onPressed: () async {
                        setState(() {
                          saving = false;
                        });
                        if (nameController.text.trim().length < 3) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("O nome deve ser preenchido")));
                          return;
                        }
                        if (birthday == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Data de nascimento inválida")));
                          return;
                        }
                        if (selectedLevel.trim() == '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("O nível deve ser selecionado")));
                          return;
                        }
                        if (selectedLanguage.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Selecione pelo menos uma linguagem")));
                          return;
                        }
                        if (experienceTime == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Deve ter pelo menos 1 ano de experiência em uma das linguagens")));
                          return;
                        }
                        if (selectedSalary == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "A pretenção salarial deve ser maior que 0")));
                          return;
                        }
                        await storage
                            .setRegistrationDataName(nameController.text);
                        await storage.setRegistrationDataBirthday(birthday!);
                        await storage
                            .setRegistrationDataExperienceLevel(selectedLevel);
                        await storage
                            .setRegistrationDataLanguages(selectedLanguage);
                        await storage
                            .setRegistrationDataExperienceTime(experienceTime);
                        await storage.setRegistrationDataSalary(selectedSalary);

                        setState(() {
                          saving = true;
                        });

                        Future.delayed(const Duration(seconds: 3), () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Dados salvo com sucesso")));
                          setState(() {
                            saving = false;
                          });
                          Navigator.pop(context);
                        });
                      },
                      child: const Text("Salvar"),
                    )
                  ],
                ),
        ));
  }
}
