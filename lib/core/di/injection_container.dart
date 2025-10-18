import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Theme imports 
import '../../features/theme/data/datasources/theme_local_datasource.dart';
import '../../features/theme/data/repositories/theme_repository_impl.dart';
import '../../features/theme/domain/repositories/theme_repository.dart';
import '../../features/theme/domain/usecases/get_theme_mode.dart';
import '../../features/theme/domain/usecases/save_theme_mode.dart';
import '../../features/theme/presentation/bloc/theme_bloc.dart';
// Language imports 
import '../../features/language/data/datasources/language_local_datasource.dart';
import '../../features/language/data/repositories/language_repository_impl.dart';
import '../../features/language/domain/repositories/language_repository.dart';
import '../../features/language/domain/usecases/get_language.dart';
import '../../features/language/domain/usecases/save_language.dart';
import '../../features/language/presentation/bloc/language_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ========== BLoC ==========
  // Theme BLoC
  sl.registerFactory(
    () => ThemeBloc(
      getThemeMode: sl(),
      saveThemeMode: sl(),
    ),
  );

  // Language BLoC 
  sl.registerFactory(
    () => LanguageBloc(
      getLanguage: sl(),
      saveLanguage: sl(),
    ),
  );

  // ========== Use Cases ==========
  // Theme
  sl.registerLazySingleton(() => GetThemeMode(sl()));
  sl.registerLazySingleton(() => SaveThemeMode(sl()));

  // Language
  sl.registerLazySingleton(() => GetLanguage(sl()));
  sl.registerLazySingleton(() => SaveLanguage(sl()));

  // ========== Repositories ==========
  // Theme
  sl.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImpl(localDataSource: sl()),
  );
  // Language 
  sl.registerLazySingleton<LanguageRepository>(
    () => LanguageRepositoryImpl(localDataSource: sl()),
  );

  // ========== Data Sources ==========
  // Theme
  sl.registerLazySingleton<ThemeLocalDataSource>(
    () => ThemeLocalDataSourceImpl(sharedPreferences: sl()),
  );

  // Language
  sl.registerLazySingleton<LanguageLocalDataSource>(
    () => LanguageLocalDataSourceImpl(sharedPreferences: sl()),
  );

  // ========== External ==========
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}