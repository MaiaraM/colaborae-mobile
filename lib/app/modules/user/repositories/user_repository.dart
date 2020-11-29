import 'package:colaborae/app/modules/user/models/user_model.dart';
import 'package:colaborae/app/shared/repositories/BaseRepository.dart';

class UserRepository {
  final BaseRepository baseRepository;

  UserRepository(this.baseRepository);

  Future<dynamic> getUser(String uuid) async {
    try {
      var response = await baseRepository.get(url: "/users/$uuid");
      if (response.data != null) {
        return response.data;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<String> createUser(UserModel model) async {
    try {
      var response = await baseRepository.post(url: "/users/", body: model);
      if (response.headers.value("authorization").isNotEmpty) {
        return response.headers.value("authorization");
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<String> editUser(String uuid, UserModel model) async {
    try {
      var response = await baseRepository.put(url: "/users/$uuid", body: model);
      if (response.headers.value("authorization").isNotEmpty) {
        return response.headers.value("authorization");
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<String> deleteUser(String uuid) async {
    try {
      var response = await baseRepository.delete(url: "/users/${uuid}");
      if (response.headers.value("authorization").isNotEmpty) {
        return response.headers.value("authorization");
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
