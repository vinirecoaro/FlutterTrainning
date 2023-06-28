import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RandomNumbersPage extends StatefulWidget {
  const RandomNumbersPage({super.key});

  @override
  State<RandomNumbersPage> createState() => _RandomNumbersPageState();
}

class _RandomNumbersPageState extends State<RandomNumbersPage> {
  int? generetedNumber;
  int? clickAmount;
  final RANDOM_NUMBER_KEY = "random_number";
  final CLICK_AMOUNT_KEY = "click_amount";
  late SharedPreferences storage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      generetedNumber = storage.getInt(RANDOM_NUMBER_KEY);
      clickAmount = storage.getInt(CLICK_AMOUNT_KEY);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Gerador de números aleatórios")),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              generetedNumber == null
                  ? "Nenhum número gerado"
                  : generetedNumber.toString(),
              style: const TextStyle(fontSize: 22),
            ),
            Text(
              clickAmount == null
                  ? "Nenhum clique efetuado"
                  : clickAmount.toString(),
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            var random = Random();
            setState(() {
              generetedNumber = random.nextInt(1000);
              clickAmount = (clickAmount ?? 0) + 1;
            });
            storage.setInt(RANDOM_NUMBER_KEY, generetedNumber!);
            storage.setInt(CLICK_AMOUNT_KEY, clickAmount!);
          }),
    ));
  }
}
