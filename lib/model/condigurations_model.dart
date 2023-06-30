class ConfigurationsModel {
  String _userName = "";
  double _height = 0;
  bool _receivePullNotification = false;
  bool _darkTheme = false;

  ConfigurationsModel(this._userName, this._height,
      this._receivePullNotification, this._darkTheme);

  ConfigurationsModel.vazio() {
    _userName = "";
    _height = 0;
    _receivePullNotification = false;
    _darkTheme = false;
  }

  String get userName => _userName;

  set userName(String userName) {
    _userName = userName;
  }

  double get height => _height;

  set height(double height) {
    _height = height;
  }

  bool get receivePullNotification => _receivePullNotification;

  set receivePullNotification(bool receivePullNotification) {
    _receivePullNotification = receivePullNotification;
  }

  bool get darkTheme => _darkTheme;

  set darkTheme(bool darkTheme) {
    _darkTheme = darkTheme;
  }
}
