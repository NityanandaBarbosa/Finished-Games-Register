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

  final _$listOfPublishersAtom = Atom(name: '_ListStoreBase.listOfPublishers');

  @override
  List<PublisherModel> get listOfPublishers {
    _$listOfPublishersAtom.reportRead();
    return super.listOfPublishers;
  }

  @override
  set listOfPublishers(List<PublisherModel> value) {
    _$listOfPublishersAtom.reportWrite(value, super.listOfPublishers, () {
      super.listOfPublishers = value;
    });
  }

  final _$listOfGamesAtom = Atom(name: '_ListStoreBase.listOfGames');

  @override
  List<GameModel> get listOfGames {
    _$listOfGamesAtom.reportRead();
    return super.listOfGames;
  }

  @override
  set listOfGames(List<GameModel> value) {
    _$listOfGamesAtom.reportWrite(value, super.listOfGames, () {
      super.listOfGames = value;
    });
  }

  final _$listOfRegistersAtom = Atom(name: '_ListStoreBase.listOfRegisters');

  @override
  List<RegisterModel> get listOfRegisters {
    _$listOfRegistersAtom.reportRead();
    return super.listOfRegisters;
  }

  @override
  set listOfRegisters(List<RegisterModel> value) {
    _$listOfRegistersAtom.reportWrite(value, super.listOfRegisters, () {
      super.listOfRegisters = value;
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

  final _$getCRUDsDataAsyncAction = AsyncAction('_ListStoreBase.getCRUDsData');

  @override
  Future<dynamic> getCRUDsData() {
    return _$getCRUDsDataAsyncAction.run(() => super.getCRUDsData());
  }

  final _$_ListStoreBaseActionController =
      ActionController(name: '_ListStoreBase');

  @override
  dynamic setListOfRegisters(List<RegisterModel> value) {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.setListOfRegisters');
    try {
      return super.setListOfRegisters(value);
    } finally {
      _$_ListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setListOfGames(List<GameModel> value) {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.setListOfGames');
    try {
      return super.setListOfGames(value);
    } finally {
      _$_ListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setListOfPublishers(List<PublisherModel> value) {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.setListOfPublishers');
    try {
      return super.setListOfPublishers(value);
    } finally {
      _$_ListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
listOfPublishers: ${listOfPublishers},
listOfGames: ${listOfGames},
listOfRegisters: ${listOfRegisters},
futureLoadLists: ${futureLoadLists}
    ''';
  }
}
