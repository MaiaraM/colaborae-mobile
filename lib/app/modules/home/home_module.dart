import 'package:flutter_modular/flutter_modular.dart';

import '../service/buscar_servico.dart';
import '../service/search_services.dart';
import '../user/pages/search_users.dart';
import '../service/service_register_page.dart';
import '../user/pages/user_profile_page.dart';
import '../user/pages/worker_profile.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/buscar_servico', child: (_, __) => BuscarServico()),
        ModularRouter('/service_register', child: (_, __) => CadastroServico()),
        ModularRouter('/search_services', child: (_, __) => SearchService()),
        ModularRouter('/user_profile', child: (_, __) => UserProfile()),
        ModularRouter('/worker_profile', child: (_, __) => WorkerProfile()),
        ModularRouter('/search_user', child: (_, __) => SearchUsers()),
      ];
}
