import 'package:flutter/material.dart';
import 'package:trilhaapp/model/viacep_model.dart';
import 'package:trilhaapp/repositories/viacep_repository.dart';

class ZipCodeQueryPage extends StatefulWidget {
  const ZipCodeQueryPage({super.key});

  @override
  State<ZipCodeQueryPage> createState() => _ZipCodeQueryPageState();
}

class _ZipCodeQueryPageState extends State<ZipCodeQueryPage> {
  var zipCodeController = TextEditingController(text: "");
  bool loading = false;

  var viacepModel = ViaCEPModel();
  var viaCepRepository = ViaCepRepository();

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
                  viacepModel = await viaCepRepository.consultarCEP(cep);
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
              style: const TextStyle(fontSize: 22),
            ),
            Text(
              "${viacepModel.localidade ?? ""} - ${viacepModel.uf ?? ""}",
              style: const TextStyle(fontSize: 22),
            ),
            Visibility(visible: loading, child: CircularProgressIndicator())
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        child: const Icon(Icons.add),
      ),
    ));
  }
}
