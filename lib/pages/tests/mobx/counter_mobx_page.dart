import 'package:flutter/material.dart';
import 'package:trilhaapp/service/counter_mobx_service.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CounterMobXPage extends StatelessWidget {
  CounterMobXPage({super.key});

  var counterMobXService = CounterMobXService();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Observer(builder: (context) {
          return Text(
            "${counterMobXService.counter}",
            style: const TextStyle(fontSize: 20),
          );
        }),
        TextButton(
            onPressed: () {
              counterMobXService.increment();
            },
            child: const Text("Incrementar"))
      ],
    );
  }
}
