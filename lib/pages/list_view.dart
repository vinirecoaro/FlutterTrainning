import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/app_images.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.user2),
          title: const Text("Usuario 2"),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Olá, tudo bem?"),
              Text("08:59"),
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              debugPrint("---");
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem(value: "opcao1", child: Text("Opção 1")),
                const PopupMenuItem(value: "opcao2", child: Text("Opção 2")),
                const PopupMenuItem(value: "opcao3", child: Text("Opção 3"))
              ];
            },
          ),
        ),
        Image.asset(AppImages.user1),
        Image.asset(AppImages.user2),
        Image.asset(AppImages.user3),
        Image.asset(AppImages.view1),
        Image.asset(AppImages.view2),
        Image.asset(AppImages.view3),
      ],
    );
  }
}
