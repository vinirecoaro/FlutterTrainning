import 'dart:math';
import 'package:flutter/material.dart';
import 'package:trilhaapp/service/app_storage_serveice.dart';

class RandomNumbersPage extends StatefulWidget {
  const RandomNumbersPage({super.key});

  @override
  State<RandomNumbersPage> createState() => _RandomNumbersPageState();
}

class _RandomNumbersPageState extends State<RandomNumbersPage> {
  int generetedNumber = 0;
  int clickAmount = 0;
  AppStorageService storage = AppStorageService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    generetedNumber = await storage.getRandomNumber();
    clickAmount = await storage.getClickAmount();
    setState(() {});
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
              clickAmount = clickAmount + 1;
            });
            storage.setRandomNumber(generetedNumber);
            storage.setClickAmount(clickAmount);
          }),
    ));
  }
}
