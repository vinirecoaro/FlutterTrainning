// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_mobx_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskStore on _TaskStore, Store {
  late final _$descriptionAtom =
      Atom(name: '_TaskStore.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$concludedAtom =
      Atom(name: '_TaskStore.concluded', context: context);

  @override
  bool get concluded {
    _$concludedAtom.reportRead();
    return super.concluded;
  }

  @override
  set concluded(bool value) {
    _$concludedAtom.reportWrite(value, super.concluded, () {
      super.concluded = value;
    });
  }

  late final _$_TaskStoreActionController =
      ActionController(name: '_TaskStore', context: context);

  @override
  dynamic change(String pDescription, bool pConcluded) {
    final _$actionInfo =
        _$_TaskStoreActionController.startAction(name: '_TaskStore.change');
    try {
      return super.change(pDescription, pConcluded);
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
description: ${description},
concluded: ${concluded}
    ''';
  }
}
