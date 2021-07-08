// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GameStore on _GameStoreBase, Store {
  final _$releaseDateAtom = Atom(name: '_GameStoreBase.releaseDate');

  @override
  DateTime get releaseDate {
    _$releaseDateAtom.reportRead();
    return super.releaseDate;
  }

  @override
  set releaseDate(DateTime value) {
    _$releaseDateAtom.reportWrite(value, super.releaseDate, () {
      super.releaseDate = value;
    });
  }

  final _$pubChoiceAtom = Atom(name: '_GameStoreBase.pubChoice');

  @override
  PublisherModel get pubChoice {
    _$pubChoiceAtom.reportRead();
    return super.pubChoice;
  }

  @override
  set pubChoice(PublisherModel value) {
    _$pubChoiceAtom.reportWrite(value, super.pubChoice, () {
      super.pubChoice = value;
    });
  }

  final _$gameNameAtom = Atom(name: '_GameStoreBase.gameName');

  @override
  String get gameName {
    _$gameNameAtom.reportRead();
    return super.gameName;
  }

  @override
  set gameName(String value) {
    _$gameNameAtom.reportWrite(value, super.gameName, () {
      super.gameName = value;
    });
  }

  final _$idPubAtom = Atom(name: '_GameStoreBase.idPub');

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

  final _$gameToEditAtom = Atom(name: '_GameStoreBase.gameToEdit');

  @override
  GameModel get gameToEdit {
    _$gameToEditAtom.reportRead();
    return super.gameToEdit;
  }

  @override
  set gameToEdit(GameModel value) {
    _$gameToEditAtom.reportWrite(value, super.gameToEdit, () {
      super.gameToEdit = value;
    });
  }

  final _$_GameStoreBaseActionController =
      ActionController(name: '_GameStoreBase');

  @override
  dynamic setGameToEdit(GameModel value) {
    final _$actionInfo = _$_GameStoreBaseActionController.startAction(
        name: '_GameStoreBase.setGameToEdit');
    try {
      return super.setGameToEdit(value);
    } finally {
      _$_GameStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_GameStoreBaseActionController.startAction(
        name: '_GameStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_GameStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIdPub(String value) {
    final _$actionInfo = _$_GameStoreBaseActionController.startAction(
        name: '_GameStoreBase.setIdPub');
    try {
      return super.setIdPub(value);
    } finally {
      _$_GameStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setReleaseDate(DateTime value) {
    final _$actionInfo = _$_GameStoreBaseActionController.startAction(
        name: '_GameStoreBase.setReleaseDate');
    try {
      return super.setReleaseDate(value);
    } finally {
      _$_GameStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPubChoice(dynamic value) {
    final _$actionInfo = _$_GameStoreBaseActionController.startAction(
        name: '_GameStoreBase.setPubChoice');
    try {
      return super.setPubChoice(value);
    } finally {
      _$_GameStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setGameValues() {
    final _$actionInfo = _$_GameStoreBaseActionController.startAction(
        name: '_GameStoreBase.setGameValues');
    try {
      return super.setGameValues();
    } finally {
      _$_GameStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
releaseDate: ${releaseDate},
pubChoice: ${pubChoice},
gameName: ${gameName},
idPub: ${idPub},
gameToEdit: ${gameToEdit}
    ''';
  }
}
