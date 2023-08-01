import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:trilhaapp/pages/tests/home_page_3.dart';
import 'package:trilhaapp/repositories/task_repository_provider.dart';
import 'package:trilhaapp/service/counter_provider_service.dart';
import 'package:trilhaapp/service/dark_mode_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DarkModeService()),
        ChangeNotifierProvider<CounterproviderService>(
            create: (_) => CounterproviderService()),
        ChangeNotifierProvider<TaskProviderRepository>(
            create: (_) => TaskProviderRepository())
      ],
      child: Consumer<DarkModeService>(builder: (_, darkModeService, widget) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: darkModeService.darkMode
              ? ThemeData.dark()
              : ThemeData(
                  primarySwatch: Colors.blue,
                  textTheme: GoogleFonts.robotoTextTheme()),
          debugShowCheckedModeBanner: false,
          home: const HomePage3(),
        );
      }),
    );
  }
}
