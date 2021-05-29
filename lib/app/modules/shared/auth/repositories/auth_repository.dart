import 'package:finished_games_register/app/modules/shared/auth/repositories/auth_repository_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String userData;

  @override
  Future singinByEmailPassword(email, password) {
    // TODO: implement singinByEmailPassword
    throw UnimplementedError();
  }

  @override
  Future singupByEmailPassword(userEmail, userPassword) async {
    try {
      print("Try to Sing Up");
      print(userEmail);
      print(userPassword);
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userEmail, password: userPassword);
      if (userCredential != null) {
        print("Success Sing UP");
        userData = userCredential.toString();
        print(userCredential.user.uid);
        Modular.to.pushNamed('/lists');
      }
    } catch (e) {
      print("Sing Up FAILED");
      print(e);
    }
  }

  @override
  Future<String> getUser() async {
    return await this.userData;
  }
}
