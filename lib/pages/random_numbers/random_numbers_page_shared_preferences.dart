import 'dart:math';
import 'package:flutter/material.dart';
import 'package:trilhaapp/service/app_storage_serveice.dart';

class RandomNumbersSharedPreferencesPage extends StatefulWidget {
  const RandomNumbersSharedPreferencesPage({super.key});

  @override
  State<RandomNumbersSharedPreferencesPage> createState() =>
      _RandomNumbersSharedPreferencesPageState();
}

class _RandomNumbersSharedPreferencesPageState
    extends State<RandomNumbersSharedPreferencesPage> {
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
              generetedNumber.toString(),
              style: const TextStyle(fontSize: 22),
            ),
            Text(
              clickAmount.toString(),
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
