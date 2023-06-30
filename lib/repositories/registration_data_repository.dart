import 'package:hive/hive.dart';
import 'package:trilhaapp/model/registration_data_model.dart';

class RegistrationDataRepository {
  static late Box _box;

  RegistrationDataRepository._create();

  static Future<RegistrationDataRepository> load() async {
    if (Hive.isBoxOpen("registration_data_model")) {
      _box = Hive.box("registration_data_model");
    } else {
      _box = await Hive.openBox("registration_data_model");
    }
    return RegistrationDataRepository._create();
  }

  save(RegistrationDataModel registrationDataModel) {
    _box.put("registration_data_model", registrationDataModel);
  }

  RegistrationDataModel obtainData() {
    var registrationDataModel = _box.get("registration_data_model");
    if (registrationDataModel == null) {
      return RegistrationDataModel.empty();
    }
    return registrationDataModel;
  }
}
