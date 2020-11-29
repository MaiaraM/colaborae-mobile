import 'package:colaborae/app/modules/user/models/user_model.dart';
import 'package:colaborae/app/modules/user/repositories/user_repository.dart';
import 'package:colaborae/app/shared/service/shared_local_storage_service.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobx/mobx.dart';

part 'user_controller.g.dart';

class UserController = _UserController with _$UserController;

abstract class _UserController with Store {
  final UserRepository repository;
  final SharedLocalStorageService localStorage;

  _UserController(this.repository, this.localStorage);

  @observable
  UserModel user;

  @observable
  bool loading = false;

  @action
  getUser(String uuid) async {
    loading = true;
    dynamic user = await repository.getUser(uuid);
    loading = false;
  }

  @action
  getUserLogin() async {
    loading = true;
    var token = await localStorage.get("auth_token");
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    dynamic user = await repository.getUser(decodedToken["sub"]);
    this.user = UserModel.fromJson(user);
    loading = false;
  }

  @action
  createUser(UserModel newUser) async {
    loading = true;
    dynamic user = await repository.createUser(newUser);
    loading = false;
  }

  @action
  editUser(String uuid, UserModel newUser) async {
    loading = true;
    dynamic user = await repository.editUser(uuid, newUser);
    loading = false;
  }

  @action
  deleteUser(String uuid) async {
    loading = true;
    dynamic user = await repository.deleteUser(uuid);
    loading = false;
  }
}