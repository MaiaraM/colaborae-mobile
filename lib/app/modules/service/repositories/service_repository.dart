import 'package:colaborae/app/modules/service/models/service_model.dart';
import 'package:colaborae/app/shared/repositories/BaseRepository.dart';

class ServiceRepository {
  final BaseRepository baseRepository;

  ServiceRepository(this.baseRepository);

  Future<dynamic> getService(String uuid) async {
    try {
      var response = await baseRepository.get(url: "/services/$uuid");
      if (response.data != null) {
        return response.data;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> createService(ServiceModel model) async {
    try {
      var response =
          await baseRepository.post(url: "/services/", body: model.toJson());
      if (response.data != null) {
        return response.data;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> editService(String uuid, ServiceModel model) async {
    try {
      var response = await baseRepository.put(
          url: "/services/$uuid", body: model.toJson());
      if (response.data != null) {
        return response.data;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> deleteService(String uuid) async {
    try {
      var response = await baseRepository.delete(url: "/services/$uuid");
      if (response.data != null) {
        return response.data;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> searchService(String searchText) async {
    try {
      var response =
          await baseRepository.get(url: '/services/search?title=$searchText');
      if (response.data != null) {
        return response.data;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
