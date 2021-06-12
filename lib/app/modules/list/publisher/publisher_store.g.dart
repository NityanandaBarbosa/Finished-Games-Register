// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publisher_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PublisherStore on _PublisherStoreBase, Store {
  final _$valueAtom = Atom(name: '_PublisherStoreBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_PublisherStoreBaseActionController =
      ActionController(name: '_PublisherStoreBase');

  @override
  void increment() {
    final _$actionInfo = _$_PublisherStoreBaseActionController.startAction(
        name: '_PublisherStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_PublisherStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
