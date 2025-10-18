import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/theme/data/datasources/theme_local_datasource.dart';
import '../../features/theme/data/repositories/theme_repository_impl.dart';
import '../../features/theme/domain/repositories/theme_repository.dart';
import '../../features/theme/domain/usecases/get_theme_mode.dart';
import '../../features/theme/domain/usecases/save_theme_mode.dart';
import '../../features/theme/presentation/bloc/theme_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC
  sl.registerFactory(
    () => ThemeBloc(
      getThemeMode: sl(),
      saveThemeMode: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetThemeMode(sl()));
  sl.registerLazySingleton(() => SaveThemeMode(sl()));

  // Repository
  sl.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImpl(localDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<ThemeLocalDataSource>(
    () => ThemeLocalDataSourceImpl(sharedPreferences: sl()),
  );

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}