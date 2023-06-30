import 'package:hive/hive.dart';
import 'package:trilhaapp/model/condigurations_model.dart';

class ConfigurationRepository {
  static late Box _box;

  ConfigurationRepository._create();

  static Future<ConfigurationRepository> load() async {
    if (Hive.isBoxOpen("configurations")) {
      _box = Hive.box("configurations");
    } else {
      _box = await Hive.openBox("configurations");
    }
    return ConfigurationRepository._create();
  }

  void save(ConfigurationsModel configurationsModel) {
    _box.put("configurations_model", {
      "user_name": configurationsModel.userName,
      "height": configurationsModel.height,
      "receive_pull_notifications": configurationsModel.receivePullNotification,
      "dark_theme": configurationsModel.darkTheme,
    });
  }

  ConfigurationsModel obtainData() {
    var configurations = _box.get("configurations_model");
    if (configurations == null) {
      return ConfigurationsModel.vazio();
    }
    return ConfigurationsModel(
      configurations["user_name"],
      configurations["height"],
      configurations["receive_pull_notifications"],
      configurations["dark_theme"],
    );
  }
}
