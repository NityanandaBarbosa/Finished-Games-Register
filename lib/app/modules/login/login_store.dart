import 'package:finished_games_register/app/modules/shared/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  AuthStore auth = Modular.get();

  @observable
  String emailField;
  @observable
  String passwordField;

  @action
  Future singUp() async {
    try {
      print("Login from Store");
      await auth.singupByEmailPassword(emailField, passwordField);
    } catch (e) {
      print("Fail");
    }
  }
}
