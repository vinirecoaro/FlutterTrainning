import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.red, textTheme: GoogleFonts.robotoTextTheme()),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
