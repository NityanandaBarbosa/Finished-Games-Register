// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterStore on _RegisterStoreBase, Store {
  final _$initDateAtom = Atom(name: '_RegisterStoreBase.initDate');

  @override
  DateTime get initDate {
    _$initDateAtom.reportRead();
    return super.initDate;
  }

  @override
  set initDate(DateTime value) {
    _$initDateAtom.reportWrite(value, super.initDate, () {
      super.initDate = value;
    });
  }

  final _$endDateAtom = Atom(name: '_RegisterStoreBase.endDate');

  @override
  DateTime get endDate {
    _$endDateAtom.reportRead();
    return super.endDate;
  }

  @override
  set endDate(DateTime value) {
    _$endDateAtom.reportWrite(value, super.endDate, () {
      super.endDate = value;
    });
  }

  final _$gameChoiceAtom = Atom(name: '_RegisterStoreBase.gameChoice');

  @override
  dynamic get gameChoice {
    _$gameChoiceAtom.reportRead();
    return super.gameChoice;
  }

  @override
  set gameChoice(dynamic value) {
    _$gameChoiceAtom.reportWrite(value, super.gameChoice, () {
      super.gameChoice = value;
    });
  }

  final _$registerNameAtom = Atom(name: '_RegisterStoreBase.registerName');

  @override
  String get registerName {
    _$registerNameAtom.reportRead();
    return super.registerName;
  }

  @override
  set registerName(String value) {
    _$registerNameAtom.reportWrite(value, super.registerName, () {
      super.registerName = value;
    });
  }

  final _$idPubAtom = Atom(name: '_RegisterStoreBase.idPub');

  @override
  String get idPub {
    _$idPubAtom.reportRead();
    return super.idPub;
  }

  @override
  set idPub(String value) {
    _$idPubAtom.reportWrite(value, super.idPub, () {
      super.idPub = value;
    });
  }

  final _$responseAtom = Atom(name: '_RegisterStoreBase.response');

  @override
  dynamic get response {
    _$responseAtom.reportRead();
    return super.response;
  }

  @override
  set response(dynamic value) {
    _$responseAtom.reportWrite(value, super.response, () {
      super.response = value;
    });
  }

  final _$registerToEditAtom = Atom(name: '_RegisterStoreBase.registerToEdit');

  @override
  RegisterModel get registerToEdit {
    _$registerToEditAtom.reportRead();
    return super.registerToEdit;
  }

  @override
  set registerToEdit(RegisterModel value) {
    _$registerToEditAtom.reportWrite(value, super.registerToEdit, () {
      super.registerToEdit = value;
    });
  }

  final _$_RegisterStoreBaseActionController =
      ActionController(name: '_RegisterStoreBase');

  @override
  dynamic setRegisterToEdit(RegisterModel value) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.setRegisterToEdit');
    try {
      return super.setRegisterToEdit(value);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setInitDate(DateTime value) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.setInitDate');
    try {
      return super.setInitDate(value);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEndDate(DateTime value) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.setEndDate');
    try {
      return super.setEndDate(value);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setGameChoice(dynamic value) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.setGameChoice');
    try {
      return super.setGameChoice(value);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
initDate: ${initDate},
endDate: ${endDate},
gameChoice: ${gameChoice},
registerName: ${registerName},
idPub: ${idPub},
response: ${response},
registerToEdit: ${registerToEdit}
    ''';
  }
}
