abstract class IAuthRepository {
  Future getToken(username, password);
}
