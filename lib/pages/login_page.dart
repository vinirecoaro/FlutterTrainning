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
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                Expanded(child: Container()),
                Expanded(
                  flex: 8,
                  child: Image.network(
                      "https://hermes.digitalinnovation.one/assets/diome/logo.png"),
                ),
                Expanded(child: Container()),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Ja tem Cadastro?",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Faça seu login e make the change_",
                style: TextStyle(fontSize: 14, color: Colors.white)),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 30,
              alignment: Alignment.center,
              child: const Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Text(
                        "Informe seu Email:",
                        style: TextStyle(color: Colors.white),
                      )),
                  Expanded(
                      flex: 3,
                      child:
                          Text("Email", style: TextStyle(color: Colors.white)))
                ],
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
                  Expanded(
                      flex: 2,
                      child: Text("Informe a senha:",
                          style: TextStyle(color: Colors.white))),
                  Expanded(
                      flex: 3,
                      child:
                          Text("Senha", style: TextStyle(color: Colors.white))),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 100),
              color: Colors.green,
              height: 30,
              alignment: Alignment.center,
              child: Text("Login"),
            ),
            Expanded(child: Container()),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 100),
              height: 30,
              alignment: Alignment.center,
              child: Text("Esqueci minha senha",
                  style: TextStyle(
                      color: Colors.yellow, fontWeight: FontWeight.w400)),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 100),
              height: 30,
              alignment: Alignment.center,
              child: Text(
                "Criar conta",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
