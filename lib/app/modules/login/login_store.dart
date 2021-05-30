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
  setEmail(String value) => emailField = value;

  @action
  setPassword(String value) => passwordField = value;

  @action
  Future singUp() async {
    try {
      await auth.singupByEmailPassword(emailField, passwordField);
    } catch (e) {
      print("Fail");
    }
  }

  @action
  Future singIn() async {
    try {
      await auth.singinByEmailPassword(emailField, passwordField);
    } catch (e) {
      print("Fail");
    }
  }
}
