// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ServiceController on _ServiceController, Store {
  final _$servicesAtom = Atom(name: '_ServiceController.services');

  @override
  List<ServiceModel> get services {
    _$servicesAtom.reportRead();
    return super.services;
  }

  @override
  set services(List<ServiceModel> value) {
    _$servicesAtom.reportWrite(value, super.services, () {
      super.services = value;
    });
  }

  final _$loadingAtom = Atom(name: '_ServiceController.loading');

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

  final _$getServiceAsyncAction = AsyncAction('_ServiceController.getService');

  @override
  Future getService(String uuid) {
    return _$getServiceAsyncAction.run(() => super.getService(uuid));
  }

  final _$createServiceAsyncAction =
      AsyncAction('_ServiceController.createService');

  @override
  Future createService(ServiceModel newService) {
    return _$createServiceAsyncAction
        .run(() => super.createService(newService));
  }

  final _$searchServiceAsyncAction =
      AsyncAction('_ServiceController.searchService');

  @override
  Future searchService(String searchText) {
    return _$searchServiceAsyncAction
        .run(() => super.searchService(searchText));
  }

  final _$deleteServiceAsyncAction =
      AsyncAction('_ServiceController.deleteService');

  @override
  Future deleteService(String uuid) {
    return _$deleteServiceAsyncAction.run(() => super.deleteService(uuid));
  }

  @override
  String toString() {
    return '''
services: ${services},
loading: ${loading}
    ''';
  }
}
