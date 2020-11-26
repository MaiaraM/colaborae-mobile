import 'package:colaborae/app/pages/splash_page.dart';
import 'package:colaborae/app/shared/auth/auth_controller.dart';
import 'package:colaborae/app/shared/auth/repositories/auth_repository.dart';
import 'package:colaborae/app/shared/service/shared_local_storage_service.dart';
import 'package:colaborae/app/shared/utils/constants.dart';
import 'package:colaborae/app/shared/utils/guard_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../start.dart';
import 'app_widget.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_page.dart';
import 'modules/login/user_register_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
        Bind((i) => AuthController(
            i.get<AuthRepository>(), i.get<SharedLocalStorageService>())),
        Bind((i) => AuthRepository(i.get<Dio>())),
        Bind((i) => SharedLocalStorageService()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', module: HomeModule()),
        ModularRouter('/splash', child: (_, __) => SplashScreenPage()),
        ModularRouter('/login',
            child: (_, __) => LoginPage(), transition: TransitionType.fadeIn),
        ModularRouter('/start',
            child: (_, args) => StartingPage(),
            guards: [GuardRoutes()],
            transition: TransitionType.fadeIn),
        ModularRouter('/user_register', child: (_, __) => UserRegister()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}