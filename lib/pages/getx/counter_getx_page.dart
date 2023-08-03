import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trilhaapp/service/counter_get_controller.dart';

// ignore: must_be_immutable
class CounterGetXPage extends StatelessWidget {
  CounterGetXPage({super.key});

  var counterGetXService = CounterGetController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Counter GetX",
          style: TextStyle(fontSize: 26),
        ),
        Obx(() {
          return Text(
            "${counterGetXService.counter}",
            style: const TextStyle(fontSize: 20),
          );
        }),
        TextButton(
            onPressed: () {
              counterGetXService.increment();
            },
            child: const Text("Incrementar"))
      ],
    );
  }
}
