import 'package:colaborae/app/shared/auth/repositories/auth_repository.dart';
import 'package:colaborae/app/shared/service/shared_local_storage_service.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthController with _$AuthController;

abstract class _AuthController with Store {
  final AuthRepository repository;
  final SharedLocalStorageService localStorage;

  _AuthController(this.repository, this.localStorage);

  @observable
  bool auth_token = false;

  @action
  login(String username, String password) async {
    final token = await repository.getToken(username, password);
    if (token != null) {
      localStorage.put("auth_token", token);
      auth_token = true;
    } else {
      auth_token = false;
    }
  }

  @action
  Future logout(String username, String password) async {
    localStorage.delete("auth_token");
  }

  @action
  Future<String> isUserLogin() async {
    return localStorage.get("auth_token");
  }
}
