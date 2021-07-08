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

  final _$closedDateAtom = Atom(name: '_PublisherStoreBase.closedDate');

  @override
  DateTime get closedDate {
    _$closedDateAtom.reportRead();
    return super.closedDate;
  }

  @override
  set closedDate(DateTime value) {
    _$closedDateAtom.reportWrite(value, super.closedDate, () {
      super.closedDate = value;
    });
  }

  final _$publisherNameAtom = Atom(name: '_PublisherStoreBase.publisherName');

  @override
  String get publisherName {
    _$publisherNameAtom.reportRead();
    return super.publisherName;
  }

  @override
  set publisherName(String value) {
    _$publisherNameAtom.reportWrite(value, super.publisherName, () {
      super.publisherName = value;
    });
  }

  final _$responseAtom = Atom(name: '_PublisherStoreBase.response');

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

  final _$publisherToEditAtom =
      Atom(name: '_PublisherStoreBase.publisherToEdit');

  @override
  PublisherModel get publisherToEdit {
    _$publisherToEditAtom.reportRead();
    return super.publisherToEdit;
  }

  @override
  set publisherToEdit(PublisherModel value) {
    _$publisherToEditAtom.reportWrite(value, super.publisherToEdit, () {
      super.publisherToEdit = value;
    });
  }

  final _$_PublisherStoreBaseActionController =
      ActionController(name: '_PublisherStoreBase');

  @override
  dynamic setPublisherToEdit(PublisherModel value) {
    final _$actionInfo = _$_PublisherStoreBaseActionController.startAction(
        name: '_PublisherStoreBase.setPublisherToEdit');
    try {
      return super.setPublisherToEdit(value);
    } finally {
      _$_PublisherStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_PublisherStoreBaseActionController.startAction(
        name: '_PublisherStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_PublisherStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFoundingDate(DateTime value) {
    final _$actionInfo = _$_PublisherStoreBaseActionController.startAction(
        name: '_PublisherStoreBase.setFoundingDate');
    try {
      return super.setFoundingDate(value);
    } finally {
      _$_PublisherStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setClosedDate(DateTime value) {
    final _$actionInfo = _$_PublisherStoreBaseActionController.startAction(
        name: '_PublisherStoreBase.setClosedDate');
    try {
      return super.setClosedDate(value);
    } finally {
      _$_PublisherStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPubValues() {
    final _$actionInfo = _$_PublisherStoreBaseActionController.startAction(
        name: '_PublisherStoreBase.setPubValues');
    try {
      return super.setPubValues();
    } finally {
      _$_PublisherStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
foundingDate: ${foundingDate},
closedDate: ${closedDate},
publisherName: ${publisherName},
response: ${response},
publisherToEdit: ${publisherToEdit}
    ''';
  }
}
