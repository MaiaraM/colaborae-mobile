import 'package:colaborae/app/modules/login/models/login.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  final Dio dio;

  AuthRepository(this.dio);

  @override
  Future<String> getToken(username, password) async {
    try {
      var response = await dio.post("/login",
          data:
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
