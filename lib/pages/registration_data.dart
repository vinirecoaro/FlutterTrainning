import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Meus Dados"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextLabel(text: "Nome"),
              TextField(
                controller: nameController,
              ),
              SizedBox(
                height: 10,
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
              TextButton(
                onPressed: () {
                  print(nameController.text);
                  print(birthday.toString());
                },
                child: Text("Salvar"),
              )
            ],
          ),
        ));
  }
}
