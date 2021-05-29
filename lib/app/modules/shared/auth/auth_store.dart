import 'package:finished_games_register/app/modules/shared/auth/repositories/auth_repository_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final IAuthRepository _authRepository = Modular.get();

  @observable
  UserCredential user;

  @action
  setUser(UserCredential value) => user = value;

  _AuthStoreBase() {
    _authRepository.getUser().then(setUser);
    print("Setou");
    print(user);
  }

  Future singupByEmailPassword(email, password) async {
    print("DENTRO da Auth_STORE");
    user = (await _authRepository.singupByEmailPassword(email, password));
    print("Current");
    print(user.user.uid);
  }
}
