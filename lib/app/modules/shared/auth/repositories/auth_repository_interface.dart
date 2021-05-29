import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future singinByEmailPassword(email, password);
  Future<UserCredential> singupByEmailPassword(email, password);
  Future<UserCredential> getUser();
}
