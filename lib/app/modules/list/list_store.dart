import 'package:finished_games_register/app/modules/shared/auth/auth_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'list_store.g.dart';

class ListStore = _ListStoreBase with _$ListStore;

abstract class _ListStoreBase with Store {
  AuthStore auth = Modular.get();

  @observable
  String userId;

  @action
  setUser(String value) => userId = value;

  Future getCredential() async {
    userId = await auth.getUserCredential();
    setUser(userId);
    return userId;
  }
}
