import 'package:colaborae/app/modules/home/home_page.dart';
import 'package:colaborae/app/modules/service/buscar_servico.dart';
import 'package:colaborae/app/modules/service/search_services.dart';
import 'package:colaborae/app/modules/service/service_register_page.dart';
import 'package:colaborae/app/modules/user/pages/search_users.dart';
import 'package:colaborae/app/modules/user/pages/user_profile_page.dart';
import 'package:colaborae/app/modules/user/pages/worker_profile.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => HomePage()),
        ModularRouter('/buscar_servico', child: (_, __) => BuscarServico()),
        ModularRouter('/service_register', child: (_, __) => CadastroServico()),
        ModularRouter('/search_services', child: (_, __) => SearchService()),
        ModularRouter('/user_profile', child: (_, __) => UserProfile()),
        ModularRouter('/worker_profile', child: (_, __) => WorkerProfile()),
        ModularRouter('/search_user', child: (_, __) => SearchUsers()),
      ];

  static Inject get to => Inject<UserModule>.of();
}
