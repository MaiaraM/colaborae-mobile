import 'package:colaborae/app/modules/service/models/service_model.dart';
import 'package:colaborae/app/modules/service/repositories/service_repository.dart';
import 'package:colaborae/app/modules/user/controllers/user_controller.dart';
import 'package:mobx/mobx.dart';

part 'service_controller.g.dart';

class ServiceController = _ServiceController with _$ServiceController;

abstract class _ServiceController with Store {
  final ServiceRepository repository;
  final UserController userController;

  _ServiceController(this.repository, this.userController);

  @observable
  List<ServiceModel> services;

  @observable
  bool loading = false;

  @action
  getService(String uuid) async {
    loading = true;
    dynamic user = await repository.getService(uuid);
    // this.user = ServiceModel.fromJson(user);
    loading = false;
  }

  @action
  createService(ServiceModel newService) async {
    loading = true;
    newService.user = userController.user;
    dynamic service = await repository.createService(newService);
    loading = false;
    if (service != null) {
      return true;
    } else {
      return false;
    }
  }

  @action
  searchService(String searchText) async {
    loading = true;
    List<dynamic> servicesJson = new List<dynamic>();
    servicesJson = await repository.searchService(searchText);
    if (servicesJson != null) {
      List<ServiceModel> services = new List<ServiceModel>();
      servicesJson.forEach((e) => services.add(new ServiceModel.fromJson(e)));
      this.services = services;
    }
    loading = false;
  }

  @action
  deleteService(String uuid) async {
    loading = true;
    dynamic user = await repository.deleteService(uuid);
    loading = false;
  }
}
