import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trilhaapp/model/viacep_model.dart';

class ZipCodeQueryPage extends StatefulWidget {
  const ZipCodeQueryPage({super.key});

  @override
  State<ZipCodeQueryPage> createState() => _ZipCodeQueryPageState();
}

class _ZipCodeQueryPageState extends State<ZipCodeQueryPage> {
  var zipCodeController = TextEditingController(text: "");
  bool loading = false;

  var viacepModel = ViaCEPModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            const Text(
              "Consulta CEP",
              style: TextStyle(fontSize: 22),
            ),
            TextField(
              controller: zipCodeController,
              keyboardType: TextInputType.number,
              onChanged: (String value) async {
                var cep = value.replaceAll(new RegExp(r'[^0-9]'), '');
                if (cep.length >= 8) {
                  setState(() {
                    loading = true;
                  });
                  var response = await http
                      .get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));
                  var json = jsonDecode(response.body);
                  viacepModel = ViaCEPModel.fromJson(json);
                } else {}
                setState(() {
                  loading = false;
                });
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              viacepModel.logradouro ?? "",
              style: TextStyle(fontSize: 22),
            ),
            Text(
              "${viacepModel.localidade ?? ""} - ${viacepModel.uf ?? ""}",
              style: TextStyle(fontSize: 22),
            ),
            Visibility(visible: loading, child: CircularProgressIndicator())
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var response = await http.get(Uri.parse("https://www.google.com"));
          print(response);
        },
        child: const Icon(Icons.add),
      ),
    ));
  }
}
