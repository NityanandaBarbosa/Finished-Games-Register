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

  final _$pubAtom = Atom(name: '_GameStoreBase.pub');

  @override
  dynamic get pub {
    _$pubAtom.reportRead();
    return super.pub;
  }

  @override
  set pub(dynamic value) {
    _$pubAtom.reportWrite(value, super.pub, () {
      super.pub = value;
    });
  }

  final _$pubChoiceAtom = Atom(name: '_GameStoreBase.pubChoice');

  @override
  dynamic get pubChoice {
    _$pubChoiceAtom.reportRead();
    return super.pubChoice;
  }

  @override
  set pubChoice(dynamic value) {
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

  final _$responseAtom = Atom(name: '_GameStoreBase.response');

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

  final _$gameAtom = Atom(name: '_GameStoreBase.game');

  @override
  GameModel get game {
    _$gameAtom.reportRead();
    return super.game;
  }

  @override
  set game(GameModel value) {
    _$gameAtom.reportWrite(value, super.game, () {
      super.game = value;
    });
  }

  final _$_GameStoreBaseActionController =
      ActionController(name: '_GameStoreBase');

  @override
  dynamic setGame(GameModel value) {
    final _$actionInfo = _$_GameStoreBaseActionController.startAction(
        name: '_GameStoreBase.setGame');
    try {
      return super.setGame(value);
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
  String toString() {
    return '''
releaseDate: ${releaseDate},
pub: ${pub},
pubChoice: ${pubChoice},
gameName: ${gameName},
response: ${response},
game: ${game}
    ''';
  }
}
