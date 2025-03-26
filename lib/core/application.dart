import 'package:get_it/get_it.dart';
import 'package:marveldex/data/services/client/characters_client.dart';

final getIt = GetIt.instance;

class Application {
  /// Inicialização das definições do app
  static Future setup() async {
    await _clientsSetup();
    await _blocsSetup();
  }

  static Future<void> _clientsSetup() async {
    // Registro do TvShowClient
    getIt.registerLazySingleton<CharactersClient>(() => CharactersClient());
  }

  static Future<void> _blocsSetup() async {
    // Registro de blocs com bindings
    // getIt.registerFactory<HomeBloc>(() => HomeBloc(
    //       showRepository: getIt<ITvShowRepository>(),
    //     ));
  }
}
