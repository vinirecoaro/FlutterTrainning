import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AutoSizeTextPage extends StatefulWidget {
  const AutoSizeTextPage({super.key});

  @override
  State<AutoSizeTextPage> createState() => _AutoSizeTextPageState();
}

class _AutoSizeTextPageState extends State<AutoSizeTextPage> {
  var controllerText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Auto Size Text Page"),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: controllerText,
              maxLines: 5,
              onChanged: (value) {
                setState(() {});
              },
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: AutoSizeText(
                  controllerText.text,
                  maxLines: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
