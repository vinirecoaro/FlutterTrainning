import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/list_view_h.dart';
import 'package:trilhaapp/pages/task_page.dart';
import 'package:trilhaapp/shared/widgets/custom_drawer.dart';

import 'card_page.dart';
import 'image_assets.dart';
import 'list_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int pagePosition = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Main Page")),
        drawer: const CustonDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    pagePosition = value;
                  });
                },
                children: const [
                  CardPage(),
                  ImageAssetsPage(),
                  ListViewPage(),
                  ListViewHorizontalPage(),
                  TaskPage()
                ],
              ),
            ),
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                controller.jumpToPage(value);
              },
              currentIndex: pagePosition,
              items: const [
                BottomNavigationBarItem(label: "Page1", icon: Icon(Icons.home)),
                BottomNavigationBarItem(label: "Page2", icon: Icon(Icons.add)),
                BottomNavigationBarItem(
                    label: "Page3", icon: Icon(Icons.person)),
                BottomNavigationBarItem(label: "Page4", icon: Icon(Icons.list)),
                BottomNavigationBarItem(label: "Page5", icon: Icon(Icons.task)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
