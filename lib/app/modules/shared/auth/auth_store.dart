import 'package:finished_games_register/app/modules/shared/auth/repositories/auth_repository.dart';
import 'package:finished_games_register/app/modules/shared/services/users/users_api_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final AuthRepository _authRepository = Modular.get();
  final IUsersApi _usersApi = Modular.get();

  @observable
  UserCredential user;

  @observable
  var myId;

  @action
  setUser(UserCredential value) => user = value;

  @action
  setMyId(var value) => myId = value;

  _AuthStoreBase() {
    _authRepository.getUser().then(setUser);
    print("User seted up");
    print(user);
  }

  Future singupByEmailPassword(email, password) async {
    user = (await _authRepository.singupByEmailPassword(email, password));
    setUser(user);
    var id = await _usersApi.postUser(user);
    await setMyId(id);
    Modular.to.pushNamed('/lists');
  }

  Future singinByEmailPassword(email, password) async {
    user = (await _authRepository.singinByEmailPassword(email, password));
    if (user != null) {
      setUser(user);
      var users = await _usersApi.getUsers();
      await getMyId(users);
      Modular.to.pushNamed('/lists');
    }
  }

  Future getMyId(users) async {
    await users.forEach((key, value) {
      if (value['email'] == user.user.email) {
        setMyId(key);
        return key;
      }
    });
  }

  Future userId() {
    return myId;
  }

  Future<UserCredential> getUserCredential() async {
    UserCredential getCredent = await _authRepository.getUser();
    return getCredent;
  }
}
