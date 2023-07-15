import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:trilhaapp/model/task_hive_model.dart';
import 'model/registration_data_model.dart';
import 'my_app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  var documentsDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);
  Hive.registerAdapter(RegistrationDataModelAdapter());
  Hive.registerAdapter(TaskHiveModelAdapter());
  await dotenv.load(fileName: ".env");

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('pt', 'BR')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('pt', 'BR'),
        child: const MyApp()),
  );
}
