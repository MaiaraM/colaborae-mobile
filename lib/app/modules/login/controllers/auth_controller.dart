import 'package:colaborae/app/modules/user/controllers/user_controller.dart';
import 'package:colaborae/app/shared/repositories/auth_repository.dart';
import 'package:colaborae/app/shared/service/shared_local_storage_service.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthController with _$AuthController;

abstract class _AuthController with Store {
  final AuthRepository repository;
  final SharedLocalStorageService localStorage;
  final UserController userController;

  _AuthController(this.repository, this.localStorage, this.userController);

  @observable
  bool auth_token;

  @observable
  bool loading = false;

  @observable
  bool erro = false;

  @action
  login(String username, String password) async {
    loading = true;
    final token = await repository.getToken(username, password);
    if (token != null) {
      localStorage.put("auth_token", token);
      await setUserController(token);
      auth_token = true;
      erro = false;
    } else {
      auth_token = false;
      erro = true;
    }
    loading = false;
  }

  @action
  logout() async {
    await localStorage.delete("auth_token");
    auth_token = null;
  }

  @action
  getIsAuth() async {
    var token = await localStorage.get("auth_token");
    auth_token = token != null;
    if (token != null) await setUserController(token);
  }

  void setUserController(String token) async {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    await userController.getUser(decodedToken["sub"]);
  }
}
