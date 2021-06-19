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

  final _$responsePubsAtom = Atom(name: '_ListStoreBase.responsePubs');

  @override
  List<PublisherModel> get responsePubs {
    _$responsePubsAtom.reportRead();
    return super.responsePubs;
  }

  @override
  set responsePubs(List<PublisherModel> value) {
    _$responsePubsAtom.reportWrite(value, super.responsePubs, () {
      super.responsePubs = value;
    });
  }

  final _$responseGamesAtom = Atom(name: '_ListStoreBase.responseGames');

  @override
  dynamic get responseGames {
    _$responseGamesAtom.reportRead();
    return super.responseGames;
  }

  @override
  set responseGames(dynamic value) {
    _$responseGamesAtom.reportWrite(value, super.responseGames, () {
      super.responseGames = value;
    });
  }

  final _$responseRegisterAtom = Atom(name: '_ListStoreBase.responseRegister');

  @override
  dynamic get responseRegister {
    _$responseRegisterAtom.reportRead();
    return super.responseRegister;
  }

  @override
  set responseRegister(dynamic value) {
    _$responseRegisterAtom.reportWrite(value, super.responseRegister, () {
      super.responseRegister = value;
    });
  }

  final _$futureLoadListsAtom = Atom(name: '_ListStoreBase.futureLoadLists');

  @override
  Future<dynamic> get futureLoadLists {
    _$futureLoadListsAtom.reportRead();
    return super.futureLoadLists;
  }

  @override
  set futureLoadLists(Future<dynamic> value) {
    _$futureLoadListsAtom.reportWrite(value, super.futureLoadLists, () {
      super.futureLoadLists = value;
    });
  }

  final _$_ListStoreBaseActionController =
      ActionController(name: '_ListStoreBase');

  @override
  dynamic setFutureLoadList(Future<dynamic> value) {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.setFutureLoadList');
    try {
      return super.setFutureLoadList(value);
    } finally {
      _$_ListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
responsePubs: ${responsePubs},
responseGames: ${responseGames},
responseRegister: ${responseRegister},
futureLoadLists: ${futureLoadLists}
    ''';
  }
}
