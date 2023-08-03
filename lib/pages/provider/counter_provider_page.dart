import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trilhaapp/service/counter_provider_service.dart';

class CounterProviderPage extends StatelessWidget {
  const CounterProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    var counterService = Provider.of<CounterproviderService>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<CounterproviderService>(builder: (_, counterService, widget) {
          return Text(
            counterService.counter.toString(),
            style: const TextStyle(fontSize: 20),
          );
        }),
        TextButton(
            onPressed: () {
              Provider.of<CounterproviderService>(context, listen: false)
                  .increment();
            },
            child: const Text("Incrementar"))
      ],
    );
  }
}
