import 'package:flutter/material.dart';

class Task {
  final String _id = UniqueKey().toString();
  String _description = "";
  bool _concluded = false;

  Task(this._description, this._concluded);

  String get id => _id;
  String get description => _description;
  bool get concluded => _concluded;

  set description(String description) {
    _description = description;
  }

  set concluded(bool concluded) {
    _concluded = concluded;
  }
}
