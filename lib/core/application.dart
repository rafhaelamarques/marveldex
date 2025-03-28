import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:marveldex/data/services/client/characters_client.dart';
import 'package:marveldex/data/services/client/characters_client_local.dart';
import 'package:marveldex/data/services/dio/dio_manager.dart';
import 'package:marveldex/ui/pages/details/bloc/details_bloc.dart';
import 'package:marveldex/ui/pages/home/bloc/home_bloc.dart';

final getIt = GetIt.instance;

class Application {
  /// Inicialização das definições do app
  static Future setup() async {
    await dotenv.load();
    await _clientsSetup();
    await _blocsSetup();
  }

  static Future<void> _clientsSetup() async {
    // Registro de DioManager
    getIt.registerLazySingleton<DioManager>(() => DioManager.instance);

    // Registro de clients
    getIt.registerFactory<CharactersClient>(
      () => CharactersClient(dio: getIt<DioManager>()),
    );
    getIt.registerFactory<CharactersClientLocal>(() => CharactersClientLocal());
  }

  static Future<void> _blocsSetup() async {
    // Registro de blocs com bindings
    getIt.registerFactory<HomeBloc>(
      () => HomeBloc(characterClient: getIt<CharactersClient>()),
    );
    getIt.registerFactory<DetailsBloc>(() => DetailsBloc());
  }
}
