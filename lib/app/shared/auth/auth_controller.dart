import 'package:colaborae/app/shared/auth/repositories/auth_repository.dart';
import 'package:colaborae/app/shared/service/shared_local_storage_service.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthController with _$AuthController;

abstract class _AuthController with Store {
  final AuthRepository repository;
  final SharedLocalStorageService localStorage;

  _AuthController(this.repository, this.localStorage);

  @action
  Future login(String username, String password) async {
    final token = await repository.getToken(username, password);
    if (token != null) {
      localStorage.put("auth_token", token);
      localStorage.put("is_login", true);
      return true;
    }
    return false;
  }

  @action
  Future logout(String username, String password) async {
    localStorage.delete("auth_key");
    localStorage.delete("is_login");
  }

  @action
  Future<String> isUserLogin() async {
    return localStorage.get("auth_token");
  }
}
