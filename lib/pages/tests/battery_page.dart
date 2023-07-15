import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class BatteryPage extends StatefulWidget {
  const BatteryPage({super.key});

  @override
  State<BatteryPage> createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  var battery = Battery();
  var batteryStatus = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPage();
    battery.onBatteryStateChanged.listen((BatteryState state) {
      print(state);
    });
  }

  initPage() async {
    batteryStatus = (await battery.batteryLevel);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Status da Bateria: ${batteryStatus.toString()}%"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircularPercentIndicator(
              radius: 120,
              lineWidth: 5,
              percent: batteryStatus / 100,
              center: Text("${batteryStatus.toString()}.0%"),
              progressColor: Colors.green,
            ),
          ),
        ],
      ),
    ));
  }
}
