import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/service/random_number_generator_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var generatedNumber = 0;
  var clicksAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meu App",
          style: GoogleFonts.roboto(),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: 200,
              color: Colors.cyan,
              child: Text(
                "Ações do usuário",
                style: GoogleFonts.acme(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: Container(
                color: Colors.orange,
                child: Text(
                  "Foi clicado: $clicksAmount vezes",
                  style: GoogleFonts.acme(fontSize: 20),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.blueGrey,
              child: Text(
                "O número gerado foi - $generatedNumber",
                style: GoogleFonts.acme(fontSize: 20),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.greenAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.red,
                        child: Text(
                          "Nome: ",
                          style: GoogleFonts.acme(fontSize: 20),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.blue,
                        child: Text(
                          "Vinicius Recoaro",
                          style: GoogleFonts.acme(fontSize: 20),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.green,
                        child: Text(
                          "30",
                          style: GoogleFonts.acme(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_box),
          onPressed: () {
            setState(() {
              clicksAmount = clicksAmount + 1;
              generatedNumber =
                  RandomNumberGeneratorService.generateRandomNumber(50);
            });
          }),
    );
  }
}
