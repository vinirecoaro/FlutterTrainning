import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/app_images.dart';

class ListViewHorizontalPage extends StatefulWidget {
  const ListViewHorizontalPage({super.key});

  @override
  State<ListViewHorizontalPage> createState() => _ListViewHorizontalPageState();
}

class _ListViewHorizontalPageState extends State<ListViewHorizontalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Card(
                  child: Image.asset(
                    AppImages.view1,
                  ),
                ),
                Card(child: Image.asset(AppImages.view2)),
                Card(child: Image.asset(AppImages.view3)),
              ],
            ),
          ),
          Expanded(flex: 3, child: Container())
        ],
      ),
    );
  }
}
