import 'package:shared_preferences/shared_preferences.dart';

enum STORAGE_KEYS {
  REGISTRATION_DATA_NAME_KEY,
  REGISTRATION_DATA_BIRTHDAY_KEY,
  REGISTRATION_DATA_EXPERIENCE_LEVEL_KEY,
  REGISTRATION_DATA_LANGUAGES_KEY,
  REGISTRATION_DATA_EXPERIENCE_TIME_KEY,
  REGISTRATION_DATA_SALARY_KEY,
  CONFIGURATIONS_USER_NAME_KEY,
  CONFIGURATIONS_HEIGHT_KEY,
  CONFIGURATIONS_RECEIVE_PULL_NOTIFICATION_KEY,
  CONFIGURATIONS_DARK_THEME_KEY
}

class AppStorageService {
  Future<void> setconfigurationsName(String name) async {
    _setString(STORAGE_KEYS.CONFIGURATIONS_USER_NAME_KEY.toString(), name);
  }

  Future<String> getconfigurationsName() async {
    return _getString(STORAGE_KEYS.CONFIGURATIONS_USER_NAME_KEY.toString());
  }

  Future<void> setconfigurationsHeight(double height) async {
    _setDouble(STORAGE_KEYS.CONFIGURATIONS_HEIGHT_KEY.toString(), height);
  }

  Future<double> getconfigurationsHeight() async {
    return _getDouble(STORAGE_KEYS.CONFIGURATIONS_HEIGHT_KEY.toString());
  }

  Future<void> setconfigurationsReceivePullNotification(bool value) async {
    _setBool(
        STORAGE_KEYS.CONFIGURATIONS_RECEIVE_PULL_NOTIFICATION_KEY.toString(),
        value);
  }

  Future<bool> getconfigurationsReceivePullNotification() async {
    return _getBool(
        STORAGE_KEYS.CONFIGURATIONS_RECEIVE_PULL_NOTIFICATION_KEY.toString());
  }

  Future<void> setconfigurationsDarkTheme(bool value) async {
    _setBool(STORAGE_KEYS.CONFIGURATIONS_DARK_THEME_KEY.toString(), value);
  }

  Future<bool> getconfigurationsDarkTheme() async {
    return _getBool(STORAGE_KEYS.CONFIGURATIONS_DARK_THEME_KEY.toString());
  }

  Future<void> setRegistrationDataName(String name) async {
    _setString(STORAGE_KEYS.REGISTRATION_DATA_NAME_KEY.toString(), name);
  }

  Future<String> getRegistrationDataName() async {
    return _getString(STORAGE_KEYS.REGISTRATION_DATA_NAME_KEY.toString());
  }

  Future<void> setRegistrationDataBirthday(DateTime date) async {
    _setString(STORAGE_KEYS.REGISTRATION_DATA_BIRTHDAY_KEY.toString(),
        date.toString());
  }

  Future<String> getRegistrationDataBirthday() async {
    return _getString(STORAGE_KEYS.REGISTRATION_DATA_BIRTHDAY_KEY.toString());
  }

  Future<void> setRegistrationDataExperienceLevel(String value) async {
    _setString(
        STORAGE_KEYS.REGISTRATION_DATA_EXPERIENCE_LEVEL_KEY.toString(), value);
  }

  Future<String> getRegistrationDataExperienceLevel() async {
    return _getString(
        STORAGE_KEYS.REGISTRATION_DATA_EXPERIENCE_LEVEL_KEY.toString());
  }

  Future<void> setRegistrationDataLanguages(List<String> languages) async {
    _setStringList(
        STORAGE_KEYS.REGISTRATION_DATA_LANGUAGES_KEY.toString(), languages);
  }

  Future<List<String>> getRegistrationDataLanguages() async {
    return _getStringList(
        STORAGE_KEYS.REGISTRATION_DATA_LANGUAGES_KEY.toString());
  }

  Future<void> setRegistrationDataExperienceTime(int value) async {
    _setInt(
        STORAGE_KEYS.REGISTRATION_DATA_EXPERIENCE_TIME_KEY.toString(), value);
  }

  Future<int> getRegistrationDataExperienceTime() async {
    return _getInt(
        STORAGE_KEYS.REGISTRATION_DATA_EXPERIENCE_TIME_KEY.toString());
  }

  Future<void> setRegistrationDataSalary(double value) async {
    _setDouble(STORAGE_KEYS.REGISTRATION_DATA_SALARY_KEY.toString(), value);
  }

  Future<double> getRegistrationDataSalary() async {
    return _getDouble(STORAGE_KEYS.REGISTRATION_DATA_SALARY_KEY.toString());
  }

  Future<void> _setString(String key, String value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setString(key, value);
  }

  Future<String> _getString(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(key) ?? "";
  }

  Future<void> _setStringList(String key, List<String> values) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setStringList(key, values);
  }

  Future<List<String>> _getStringList(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getStringList(key) ?? [];
  }

  Future<void> _setInt(String key, int value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setInt(key, value);
  }

  Future<int> _getInt(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getInt(key) ?? 0;
  }

  Future<void> _setDouble(String key, double value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setDouble(key, value);
  }

  Future<double> _getDouble(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(key) ?? 0;
  }

  Future<void> _setBool(String key, bool value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setBool(key, value);
  }

  Future<bool> _getBool(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(key) ?? false;
  }
}
