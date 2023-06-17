import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String text;
  const TextLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
    );
  }
}
