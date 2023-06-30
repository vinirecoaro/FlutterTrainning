import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class RandomNumbersHivePage extends StatefulWidget {
  const RandomNumbersHivePage({super.key});

  @override
  State<RandomNumbersHivePage> createState() => _RandomNumbersHivePageState();
}

class _RandomNumbersHivePageState extends State<RandomNumbersHivePage> {
  int generetedNumber = 0;
  int clickAmount = 0;
  late Box randomNumberBox;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    if (Hive.isBoxOpen("random_number_box")) {
      randomNumberBox = Hive.box("random_number_box");
    } else {
      randomNumberBox = await Hive.openBox("random_number_box");
    }
    generetedNumber = randomNumberBox.get("genereted_number") ?? 0;
    clickAmount = randomNumberBox.get("click_amount") ?? 0;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Hive")),
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
            randomNumberBox.put("genereted_number", generetedNumber);
            randomNumberBox.put("click_amount", clickAmount);
          }),
    ));
  }
}
