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
    print("User seted up");
    print(user);
  }

  Future singupByEmailPassword(email, password) async {
    user = (await _authRepository.singupByEmailPassword(email, password));
    setUser(user);
  }

  Future singinByEmailPassword(email, password) async {
    user = (await _authRepository.singinByEmailPassword(email, password));
    setUser(user);
  }

  Future<String> getUserCredential() async {
    UserCredential getCredent = await _authRepository.getUser();
    String userUid = getCredent.user.uid;
    return userUid;
  }
}
