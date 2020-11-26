// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthController, Store {
  final _$auth_tokenAtom = Atom(name: '_AuthController.auth_token');

  @override
  bool get auth_token {
    _$auth_tokenAtom.reportRead();
    return super.auth_token;
  }

  @override
  set auth_token(bool value) {
    _$auth_tokenAtom.reportWrite(value, super.auth_token, () {
      super.auth_token = value;
    });
  }

  final _$loadingAtom = Atom(name: '_AuthController.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_AuthController.login');

  @override
  Future login(String username, String password) {
    return _$loginAsyncAction.run(() => super.login(username, password));
  }

  final _$logoutAsyncAction = AsyncAction('_AuthController.logout');

  @override
  Future logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$getIsAuthAsyncAction = AsyncAction('_AuthController.getIsAuth');

  @override
  Future getIsAuth() {
    return _$getIsAuthAsyncAction.run(() => super.getIsAuth());
  }

  @override
  String toString() {
    return '''
auth_token: ${auth_token},
loading: ${loading}
    ''';
  }
}
