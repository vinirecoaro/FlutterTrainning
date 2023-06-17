import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/widgets/custom_drawer.dart';

import 'page1.dart';
import 'page2.dart';
import 'page3.dart';

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
                  Page1(),
                  Page2(),
                  Page3(),
                ],
              ),
            ),
            BottomNavigationBar(
              onTap: (value) {
                controller.jumpToPage(value);
              },
              currentIndex: pagePosition,
              items: const [
                BottomNavigationBarItem(label: "Page1", icon: Icon(Icons.home)),
                BottomNavigationBarItem(label: "Page2", icon: Icon(Icons.add)),
                BottomNavigationBarItem(
                    label: "Page3", icon: Icon(Icons.person)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
