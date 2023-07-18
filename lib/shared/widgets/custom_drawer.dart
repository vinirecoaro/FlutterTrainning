import 'package:path_provider/path_provider.dart' as path;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:trilhaapp/pages/characters/characters_page.dart';
import 'package:trilhaapp/pages/configurations/configurations_hive_page.dart';
import 'package:trilhaapp/pages/login_page.dart';
import 'package:trilhaapp/pages/post_page.dart';
import 'package:trilhaapp/pages/random_numbers/random_numbers_page_hive.dart';
import 'package:trilhaapp/pages/task/task_http_page.dart';
import 'package:trilhaapp/pages/tests/auto_size_text_page.dart';
import 'package:trilhaapp/pages/tests/battery_page.dart';
import 'package:trilhaapp/pages/tests/connectivity_plus_page.dart';
import 'package:trilhaapp/pages/tests/geolocator_page.dart';
import 'package:trilhaapp/pages/tests/percent_indicator_page.dart';
import 'package:trilhaapp/pages/tests/qr_code_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../pages/registration_data/registration_data_hive.dart';

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("Camera"),
                          leading: const Icon(Icons.camera),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("Galeria"),
                          leading: const Icon(Icons.album),
                        ),
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.blueAccent),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.network(
                      "https://hermes.digitalinnovation.one/assets/diome/logo.png"),
                ),
                accountName: const Text("Vinicius Recoaro"),
                accountEmail: const Text("email@email.com")),
          ),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Dados Cadastrais"),
                    ],
                  )),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegistrationDataHivePage(),
                    ));
              }),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.info),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Termos de uso e privacidade"),
                  ],
                )),
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  context: context,
                  builder: (BuildContext bc) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      child: const Column(
                        children: [
                          Text(
                            "Termos de uso e privacidade",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "O incentivo ao avanço tecnológico, assim como o desafiador cenário globalizado acarreta um processo de reformulação e modernização do retorno esperado a longo prazo.",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    );
                  });
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.numbers),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Gerador de Números"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (bc) => const RandomNumbersHivePage()));
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(FontAwesomeIcons.toolbox),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Configurações"),
                  ],
                )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (bc) => const ConfigurationsHivePage()));
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.post_add),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Posts"),
                  ],
                )),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (bc) => const PostsPage()));
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.fireplace),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Heróis"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (bc) => const CharactersPage()));
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.fireplace),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Tarefas HTTP"),
                  ],
                )),
            onTap: () async {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (bc) => const TaskHttpPage()));
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.percent),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Indicadores de porcentagem"),
                  ],
                )),
            onTap: () async {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (bc) => const PercentIndicatorPage()));
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.text_format),
                    SizedBox(
                      width: 20,
                    ),
                    Text("AutoSize Text"),
                  ],
                )),
            onTap: () async {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (bc) => const AutoSizeTextPage()));
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.flag),
                      SizedBox(
                        width: 20,
                      ),
                      Text("pt-BR"),
                    ],
                  )),
              onTap: () {
                if (context.locale.toString() == "pt_BR") {
                  context.setLocale(Locale('en', 'US'));
                } else {
                  context.setLocale(Locale('pt', 'BR'));
                }
                Navigator.pop(context);
              }),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.battery_0_bar),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Bateria"),
                    ],
                  )),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (bc) => const BatteryPage()));
              }),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Abrir Dio"),
                    ],
                  )),
              onTap: () async {
                await launchUrl(Uri.parse("https://dio.me"));
              }),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.maps_home_work_outlined),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Abrir Google Maps"),
                    ],
                  )),
              onTap: () async {
                await launchUrl(Uri.parse("https://www.google.com.br/maps"));
              }),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.share),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Compartilhar"),
                    ],
                  )),
              onTap: () {
                Share.share('De uma olhada nesse site https://dio.me');
              }),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_back),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Path"),
                    ],
                  )),
              onTap: () async {
                var directory = await path.getTemporaryDirectory();
                print(directory.path);
              }),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.wifi),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Conexão"),
                    ],
                  )),
              onTap: () async {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (bc) => ConnectivityPlusPage()));
              }),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.map_outlined),
                      SizedBox(
                        width: 20,
                      ),
                      Text("GPS"),
                    ],
                  )),
              onTap: () async {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (bc) => GeolocatorPage()));
              }),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.qr_code),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Qr Code"),
                    ],
                  )),
              onTap: () async {
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (bc) => QrCodePage()));
              }),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Sair"),
                  ],
                )),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      title: const Text("Meu app"),
                      content: const Wrap(
                        children: [
                          Text("Você sairá do aplicativo"),
                          Text("Deseja realmente sair do aplicativo?")
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Não")),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: const Text("Sim"))
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
