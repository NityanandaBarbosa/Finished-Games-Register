// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListStore on _ListStoreBase, Store {
  final _$userIdAtom = Atom(name: '_ListStoreBase.userId');

  @override
  String get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(String value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  final _$userEmailAtom = Atom(name: '_ListStoreBase.userEmail');

  @override
  String get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  final _$selectedIndexAtom = Atom(name: '_ListStoreBase.selectedIndex');

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  final _$responseAtom = Atom(name: '_ListStoreBase.response');

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

  final _$_ListStoreBaseActionController =
      ActionController(name: '_ListStoreBase');

  @override
  dynamic setUser(String value) {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_ListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUserEmail(String value) {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.setUserEmail');
    try {
      return super.setUserEmail(value);
    } finally {
      _$_ListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIndex(int value) {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.setIndex');
    try {
      return super.setIndex(value);
    } finally {
      _$_ListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userId: ${userId},
userEmail: ${userEmail},
selectedIndex: ${selectedIndex},
response: ${response}
    ''';
  }
}
