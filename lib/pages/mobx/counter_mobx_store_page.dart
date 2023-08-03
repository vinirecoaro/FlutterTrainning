import 'package:flutter/material.dart';
import 'package:trilhaapp/service/counter_mobx_service.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// ignore: must_be_immutable
class CounterMobXStorePage extends StatelessWidget {
  CounterMobXStorePage({super.key});

  var counterMobXStore = CounterMobXStore();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Observer(builder: (context) {
          return Text(
            "${counterMobXStore.counter}",
            style: const TextStyle(fontSize: 20),
          );
        }),
        TextButton(
            onPressed: () {
              counterMobXStore.increment();
            },
            child: const Text("Incrementar"))
      ],
    );
  }
}
