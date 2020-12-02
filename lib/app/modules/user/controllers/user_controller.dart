import 'package:colaborae/app/modules/user/models/user_model.dart';
import 'package:colaborae/app/modules/user/repositories/user_repository.dart';
import 'package:colaborae/app/shared/service/shared_local_storage_service.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobx/mobx.dart';
import 'package:colaborae/app/modules/service/models/service_model.dart';

part 'user_controller.g.dart';

class UserController = _UserController with _$UserController;

abstract class _UserController with Store {
  final UserRepository repository;
  final SharedLocalStorageService localStorage;

  @observable
  List<ServiceModel> services;

  _UserController(this.repository, this.localStorage);

  @observable
  UserModel user;

  @observable
  bool loading = false;

  @action
  getUser(String uuid) async {
    loading = true;
    dynamic user = await repository.getUser(uuid);
    this.user = UserModel.fromJson(user);
    loading = false;
  }

  @action
  getUserLogin() async {
    loading = true;
    var token = await localStorage.get("auth_token");
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    await this.getUser(decodedToken["sub"]);
    loading = false;
  }

  @action
  createUser(UserModel newUser) async {
    loading = true;
    dynamic user = await repository.createUser(newUser);
    loading = false;
    if (user != null) {
      this.user = UserModel.fromJson(user);
      return true;
    } else {
      return false;
    }
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

  @action
  getServiceByUser() async {
    loading = true;
    List<dynamic> servicesJson =
        await repository.findServiceByUuid(this.user.uuid);
    List<ServiceModel> services = new List<ServiceModel>();
    servicesJson.forEach((e) => services.add(new ServiceModel.fromJson(e)));
    this.services = services;
    loading = false;
    return services;
  }
}
