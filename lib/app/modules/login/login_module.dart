import 'package:colaborae/app/modules/login/login_page.dart';
import 'package:colaborae/app/shared/repositories/auth_repository.dart';
import 'package:colaborae/app/shared/service/shared_local_storage_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/auth_controller.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/login', child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
