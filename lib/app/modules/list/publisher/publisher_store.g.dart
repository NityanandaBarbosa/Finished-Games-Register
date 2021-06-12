// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publisher_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PublisherStore on _PublisherStoreBase, Store {
  final _$foundingDateAtom = Atom(name: '_PublisherStoreBase.foundingDate');

  @override
  DateTime get foundingDate {
    _$foundingDateAtom.reportRead();
    return super.foundingDate;
  }

  @override
  set foundingDate(DateTime value) {
    _$foundingDateAtom.reportWrite(value, super.foundingDate, () {
      super.foundingDate = value;
    });
  }

  @override
  String toString() {
    return '''
foundingDate: ${foundingDate}
    ''';
  }
}
