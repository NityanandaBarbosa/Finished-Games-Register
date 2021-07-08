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

  @observable
  bool obscurePassword = true;

  @action
  setObscurePassword(bool value) => obscurePassword = value;

  @action
  setEmail(String value) => emailField = value;

  @action
  setPassword(String value) => passwordField = value;

  Future singUp() async {
    try {
      await auth.singupByEmailPassword(emailField, passwordField);
    } catch (e) {
      print("Fail");
    }
  }

  Future singIn() async {
    try {
      await auth.singinByEmailPassword(emailField, passwordField);
    } catch (e) {
      print("Fail");
    }
  }

  getError() async {
    var messageError;
    if (emailField == null || passwordField == null) {
      messageError = "Email or Password Empty!";
    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailField)) {
      messageError = "Email out of pattern!";
    } else if(auth.user == null) {
      messageError = "Could not connect!";
    }else {
      messageError = "Email or Password incorrect!";
    }
    return messageError;
  }
}
