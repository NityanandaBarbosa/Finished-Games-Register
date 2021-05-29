abstract class IAuthRepository {
  Future singinByEmailPassword(email, password);
  Future singupByEmailPassword(email, password);
  Future<String> getUser();
}
