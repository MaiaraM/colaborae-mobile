import 'package:colaborae/app/modules/user/user_module.dart';
import 'package:colaborae/app/pages/splash_page.dart';
import 'package:colaborae/app/shared/repositories/BaseRepository.dart';
import 'package:colaborae/app/shared/repositories/auth_repository.dart';
import 'package:colaborae/app/shared/service/shared_local_storage_service.dart';
import 'package:colaborae/app/shared/utils/constants.dart';
import 'package:colaborae/app/shared/utils/guard_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../start.dart';
import 'app_widget.dart';
import 'modules/login/controllers/auth_controller.dart';
import 'modules/login/login_module.dart';
import 'modules/user/controllers/user_controller.dart';
import 'modules/user/pages/user_register_page.dart';
import 'modules/user/repositories/user_repository.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
        Bind((i) =>
            BaseRepository(i.get<Dio>(), i.get<SharedLocalStorageService>())),
        Bind((i) => AuthRepository(i.get<BaseRepository>())),
        Bind((i) => SharedLocalStorageService()),
        Bind((i) => UserRepository(i.get<BaseRepository>())),
        Bind((i) => UserController(i.get<UserRepository>())),
        Bind((i) => AuthController(
            i.get<AuthRepository>(), i.get<SharedLocalStorageService>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/splash', child: (_, __) => SplashScreenPage()),
        ModularRouter('/login', module: LoginModule()),

        //PRIVATE
        ModularRouter(
          '/',
          module: UserModule(),
        ),
        ModularRouter('/start',
            child: (_, args) => StartingPage(),
            guards: [GuardRoutes()],
            transition: TransitionType.fadeIn),
        ModularRouter('/user_register', child: (_, __) => UserRegister()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
