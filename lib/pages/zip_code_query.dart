import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ZipCodeQueryPage extends StatefulWidget {
  const ZipCodeQueryPage({super.key});

  @override
  State<ZipCodeQueryPage> createState() => _ZipCodeQueryPageState();
}

class _ZipCodeQueryPageState extends State<ZipCodeQueryPage> {
  var zipCodeController = TextEditingController(text: "");
  String address = "";
  String city = "";
  String state = "";

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
              onChanged: (String value) {
                var cep = value.replaceAll(new RegExp(r'[^0-9]'), '');
                if (cep.length >= 8) {
                  address = "Endereco";
                  city = "Cidade";
                  state = "Estado";
                } else {
                  address = "";
                  city = "";
                  state = "";
                }
                setState(() {});
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              address,
              style: TextStyle(fontSize: 22),
            ),
            Text(
              "$city - $state",
              style: TextStyle(fontSize: 22),
            ),
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
