import 'package:flutter/material.dart';
import 'package:trilhaapp/model/registration_data_model.dart';
import 'package:trilhaapp/repositories/languages_repository.dart';
import 'package:trilhaapp/repositories/level_repository.dart';
import 'package:trilhaapp/repositories/registration_data_repository.dart';
import 'package:trilhaapp/shared/widgets/text_label.dart';

class RegistrationDataHivePage extends StatefulWidget {
  const RegistrationDataHivePage({super.key});

  @override
  State<RegistrationDataHivePage> createState() =>
      _RegistrationDataHivePageState();
}

class _RegistrationDataHivePageState extends State<RegistrationDataHivePage> {
  var nameController = TextEditingController(text: "");
  var birthdayController = TextEditingController(text: "");
  var levelRepository = LevelRepository();
  var levels = [];
  var languagesRepository = LanguagesRepository();
  var languages = [];

  bool saving = false;

  late RegistrationDataRepository registrationDataRepository;
  var registrationDataModel = RegistrationDataModel.empty();

  @override
  void initState() {
    levels = levelRepository.returnLevels();
    languages = languagesRepository.returnLanguages();
    super.initState();
    loadData();
  }

  void loadData() async {
    registrationDataRepository = await RegistrationDataRepository.load();
    registrationDataModel = registrationDataRepository.obtainData();
    nameController.text = registrationDataModel.name ?? "";
    birthdayController.text = registrationDataModel.birthday == null
        ? ""
        : registrationDataModel.birthday.toString();
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
                          registrationDataModel.birthday = date;
                        }
                      },
                    ),
                    const TextLabel(text: "Nivel de experiência"),
                    Column(
                      children: levels
                          .map((level) => RadioListTile(
                              title: Text(level),
                              selected: registrationDataModel.experienceLevel ==
                                  level,
                              value: level,
                              groupValue: registrationDataModel.experienceLevel,
                              onChanged: (value) {
                                debugPrint(value);
                                setState(() {
                                  registrationDataModel.experienceLevel = value;
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
                              value: registrationDataModel.languages
                                  .contains(language),
                              onChanged: (bool? value) {
                                if (value!) {
                                  setState(() {
                                    registrationDataModel.languages
                                        .add(language);
                                  });
                                } else {
                                  setState(() {
                                    registrationDataModel.languages
                                        .remove(language);
                                  });
                                }
                              }))
                          .toList(),
                    ),
                    const TextLabel(text: "Tempo de experiencia"),
                    DropdownButton(
                        value: registrationDataModel.experienceTime,
                        isExpanded: true,
                        items: returnItens(50),
                        onChanged: (value) {
                          setState(() {
                            registrationDataModel.experienceTime =
                                int.parse(value.toString());
                          });
                        }),
                    TextLabel(
                        text:
                            "Pretenção salarial. R\$ ${registrationDataModel.salary?.round().toString()}"),
                    Slider(
                        min: 0,
                        max: 10000,
                        value: registrationDataModel.salary ?? 0,
                        onChanged: (double value) {
                          setState(() {
                            registrationDataModel.salary = value;
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
                        if (registrationDataModel.birthday == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Data de nascimento inválida")));
                          return;
                        }
                        if (registrationDataModel.experienceLevel == null ||
                            registrationDataModel.experienceLevel!.trim() ==
                                '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("O nível deve ser selecionado")));
                          return;
                        }
                        if (registrationDataModel.languages.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Selecione pelo menos uma linguagem")));
                          return;
                        }
                        if (registrationDataModel.experienceTime == 0 ||
                            registrationDataModel.experienceTime == null) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Deve ter pelo menos 1 ano de experiência em uma das linguagens")));
                          return;
                        }
                        if (registrationDataModel.salary == 0 ||
                            registrationDataModel.salary == null) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "A pretenção salarial deve ser maior que 0")));
                          return;
                        }

                        registrationDataModel.name = nameController.text;
                        registrationDataRepository.save(registrationDataModel);

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
