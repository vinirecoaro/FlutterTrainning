import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 171, 213, 230),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            const Icon(
              Icons.person,
              size: 125,
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 30,
              alignment: Alignment.center,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text("Informe seu Email:"), Text("Email")],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 30,
              alignment: Alignment.center,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Informe a senha:"),
                  Text("Senha"),
                ],
              ),
            ),
            Expanded(child: Container()),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 100),
              color: Colors.green,
              height: 30,
              alignment: Alignment.center,
              child: Text("Login"),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 100),
              height: 30,
              alignment: Alignment.center,
              child: Text("Cadastre-se"),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
