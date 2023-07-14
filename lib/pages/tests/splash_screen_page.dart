import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.green, Colors.purple],
              //stops: [0.7, 0.3],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight),
        ),
        child: Center(
            child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Hello world!',
              textStyle: const TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
              speed: const Duration(milliseconds: 2000),
            ),
          ],
          totalRepeatCount: 4,
          pause: const Duration(milliseconds: 1000),
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        )),
      ),
    ));
  }
}
