import 'package:cine_spot/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:cine_spot/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:cine_spot/features/auth/domain/repositories/auth_repository.dart';
import 'package:cine_spot/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:cine_spot/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:cine_spot/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:cine_spot/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

    // Auth BLoC
  sl.registerFactory(
    () => AuthBloc(
       sl(),
       sl(),
      sl(),
      sl(),
    ),
  );

  // ========== Use Cases ==========
  // Theme
  sl.registerLazySingleton(() => GetThemeMode(sl()));
  sl.registerLazySingleton(() => SaveThemeMode(sl()));

  // Language
  sl.registerLazySingleton(() => GetLanguage(sl()));
  sl.registerLazySingleton(() => SaveLanguage(sl()));

    // Auth
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => SignOutUseCase(sl()));


  // ========== Repositories ==========
  // Theme
  sl.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImpl(localDataSource: sl()),
  );
  // Language 
  sl.registerLazySingleton<LanguageRepository>(
    () => LanguageRepositoryImpl(localDataSource: sl()),
  );

   // Auth
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl( sl()),
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

    // Auth
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );


  // ========== External ==========
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // Firebase Auth
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  // Firestore
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

}