import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:trilhaapp/pages/tests/getx/task_getx_page.dart';
import 'package:trilhaapp/service/dark_mode_service.dart';
import '../../shared/widgets/custom_drawer.dart';

class HomePage3 extends StatefulWidget {
  const HomePage3({Key? key}) : super(key: key);

  @override
  State<HomePage3> createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustonDrawer(),
      appBar: AppBar(
        title: Text(
          "APP_TITLE".tr(),
          style: GoogleFonts.roboto(),
        ),
        actions: [
          const Center(child: Text("Dark mode")),
          Consumer<DarkModeService>(builder: (_, darkModeService, widget) {
            return Switch(
                value: darkModeService.darkMode,
                onChanged: (bool value) {
                  darkModeService.darkMode = value;
                });
          })
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          TaskGetXPage(),
          TaskGetXPage(),
          TaskGetXPage(),
          TaskGetXPage(),
          TaskGetXPage(),
        ],
      ),
      bottomNavigationBar: ConvexAppBar.badge(
        const {0: '99+', 1: Icons.assistant_photo, 2: Colors.redAccent},
        items: const [
          TabItem(icon: Icons.get_app, title: 'Task GetX'),
          TabItem(icon: Icons.get_app, title: 'Task GetX'),
          TabItem(icon: Icons.get_app, title: 'Task GetX'),
          TabItem(icon: Icons.get_app, title: 'Task GetX'),
          TabItem(icon: Icons.get_app, title: 'Task GetX'),
        ],
        onTap: (int i) => tabController.index = i,
        controller: tabController,
      ),
    );
  }
}
