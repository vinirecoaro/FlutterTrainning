import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trilhaapp/service/counter_service.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var counterService = Provider.of<CounterService>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<CounterService>(builder: (_, counterService, widget) {
          return Text(
            counterService.counter.toString(),
            style: TextStyle(fontSize: 20),
          );
        }),
        TextButton(
            onPressed: () {
              Provider.of<CounterService>(context, listen: false).increment();
            },
            child: Text("Incrementar"))
      ],
    );
  }
}
