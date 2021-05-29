// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  final _$emailFieldAtom = Atom(name: '_LoginStoreBase.emailField');

  @override
  String get emailField {
    _$emailFieldAtom.reportRead();
    return super.emailField;
  }

  @override
  set emailField(String value) {
    _$emailFieldAtom.reportWrite(value, super.emailField, () {
      super.emailField = value;
    });
  }

  final _$passwordFieldAtom = Atom(name: '_LoginStoreBase.passwordField');

  @override
  String get passwordField {
    _$passwordFieldAtom.reportRead();
    return super.passwordField;
  }

  @override
  set passwordField(String value) {
    _$passwordFieldAtom.reportWrite(value, super.passwordField, () {
      super.passwordField = value;
    });
  }

  final _$singUpAsyncAction = AsyncAction('_LoginStoreBase.singUp');

  @override
  Future<dynamic> singUp() {
    return _$singUpAsyncAction.run(() => super.singUp());
  }

  @override
  String toString() {
    return '''
emailField: ${emailField},
passwordField: ${passwordField}
    ''';
  }
}
