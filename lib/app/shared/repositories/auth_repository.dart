import 'package:colaborae/app/modules/login/models/login.dart';
import 'package:colaborae/app/shared/repositories/BaseRepository.dart';

class AuthRepository {
  final BaseRepository baseRepository;

  AuthRepository(this.baseRepository);

  @override
  Future<String> getToken(username, password) async {
    try {
      var response = await baseRepository.post(
          url: "/login",
          body:
              new LoginModel(username: username, password: password).toJson());
      if (response.headers.value("authorization").isNotEmpty) {
        return response.headers.value("authorization");
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
