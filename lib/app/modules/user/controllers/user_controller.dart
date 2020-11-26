import 'package:colaborae/app/modules/user/models/user_model.dart';
import 'package:colaborae/app/modules/user/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';

part 'user_controller.g.dart';

class UserController = _UserController with _$UserController;

abstract class _UserController with Store {
  final UserRepository repository;

  _UserController(this.repository);

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
