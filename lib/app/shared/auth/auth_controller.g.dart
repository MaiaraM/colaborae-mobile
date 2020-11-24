// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthController, Store {
  final _$loginAsyncAction = AsyncAction('_AuthController.login');

  @override
  Future<dynamic> login(String username, String password) {
    return _$loginAsyncAction.run(() => super.login(username, password));
  }

  final _$logoutAsyncAction = AsyncAction('_AuthController.logout');

  @override
  Future<dynamic> logout(String username, String password) {
    return _$logoutAsyncAction.run(() => super.logout(username, password));
  }

  final _$isUserLoginAsyncAction = AsyncAction('_AuthController.isUserLogin');

  @override
  Future<String> isUserLogin() {
    return _$isUserLoginAsyncAction.run(() => super.isUserLogin());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
