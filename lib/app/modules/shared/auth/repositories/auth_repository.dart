import 'package:finished_games_register/app/modules/shared/auth/repositories/auth_repository_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential userData;

  @override
  Future<UserCredential> singinByEmailPassword(userEmail, userPassword) async {
    try {
      print("Try to Sing In");
      print(userEmail);
      print(userPassword);
      UserCredential response = await _auth.signInWithEmailAndPassword(
          email: userEmail, password: userPassword);
      if (response != null) {
        userData = response;
        print("Success Sing UP");
        Modular.to.pushNamed('/lists');
        return (response);
      }
    } on FirebaseAuthException catch (e) {
      print("Sing Up FAILED");
      print(e.message);
      //print(userPassword);
    }
  }

  @override
  Future<UserCredential> singupByEmailPassword(userEmail, userPassword) async {
    try {
      print("Try to Sing Up");
      print(userEmail);
      print(userPassword);
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: userEmail, password: userPassword);
      if (userCredential != null) {
        userData = userCredential;
        print("Success Sing UP");
        Modular.to.pushNamed('/lists');
        return (userCredential);
      }
    } on FirebaseAuthException catch (e) {
      print("Sing Up FAILED");
      print(e);
    }
  }

  @override
  Future<UserCredential> getUser() async {
    return userData;
  }
}
