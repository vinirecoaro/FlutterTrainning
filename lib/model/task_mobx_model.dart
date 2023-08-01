import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'task_mobx_model.g.dart';

// This is the class used by rest of your codebase
class TaskStore = _TaskStore with _$TaskStore;

abstract class _TaskStore with Store {
  final String id = UniqueKey().toString();

  @observable
  String description = "";

  @observable
  bool concluded = false;

  _TaskStore(this.description, this.concluded);

  @action
  change(String pDescription, bool pConcluded) {
    description = pDescription;
    concluded = pConcluded;
  }
}
