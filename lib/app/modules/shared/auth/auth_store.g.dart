// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStoreBase, Store {
  final _$userAtom = Atom(name: '_AuthStoreBase.user');

  @override
  Firebase get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(Firebase value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$singupByEmailPasswordAsyncAction =
      AsyncAction('_AuthStoreBase.singupByEmailPassword');

  @override
  Future<dynamic> singupByEmailPassword(dynamic email, dynamic password) {
    return _$singupByEmailPasswordAsyncAction
        .run(() => super.singupByEmailPassword(email, password));
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
