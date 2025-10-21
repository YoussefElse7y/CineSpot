import 'package:cine_spot/core/network/dio_factory.dart';
import 'package:cine_spot/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:cine_spot/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:cine_spot/features/auth/domain/repositories/auth_repository.dart';
import 'package:cine_spot/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:cine_spot/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:cine_spot/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:cine_spot/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cine_spot/features/home/data/datasource/remote_home_services.dart';
import 'package:cine_spot/features/home/data/repositories/home_repo_impl.dart';
import 'package:cine_spot/features/home/domain/repositories/home_repo.dart';
import 'package:cine_spot/features/home/domain/usecases/get_playing_now_movies.dart';
import 'package:cine_spot/features/home/domain/usecases/get_top_ten_movies_tihs_week.dart';
import 'package:cine_spot/features/home/domain/usecases/get_trending_tv_shows.dart';
import 'package:cine_spot/features/home/presentation/bloc/home_bloc.dart';
import 'package:cine_spot/features/profile/data/datasources/cloudinary_service.dart';
import 'package:cine_spot/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:cine_spot/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:cine_spot/features/profile/domain/repositories/profile_repository.dart';
import 'package:cine_spot/features/profile/domain/usecase/add_favorite_movie_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/add_wishlist_movie_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/check_profile_exists_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/create_profile_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/get_profile_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/remove_favorite_movie_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/remove_wishlist_movie_usecase.dart';
import 'package:cine_spot/features/profile/domain/usecase/update_profile_usecase.dart';
import 'package:cine_spot/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:dio/dio.dart';
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
 
  // Dio instance
final dio = DioFactory.getDio();
sl.registerLazySingleton<Dio>(() => dio);



  // ========== BLoC ==========
  // Theme BLoC
  sl.registerFactory(() => ThemeBloc(getThemeMode: sl(), saveThemeMode: sl()));

  // Language BLoC
  sl.registerFactory(() => LanguageBloc(getLanguage: sl(), saveLanguage: sl()));

  // Auth BLoC
  sl.registerFactory(() => AuthBloc(sl(), sl(), sl(), sl()));
  // Profile BLoC
   sl.registerFactory(
    () => ProfileBloc(
      createProfileUseCase: sl(),
      updateProfileUseCase: sl(),
      getProfileUseCase: sl(),
      checkProfileExistsUseCase: sl(),
      addFavoriteMovieUseCase: sl(),
      removeFavoriteMovieUseCase: sl(),
      addWishlistMovieUseCase: sl(),
      removeWishlistMovieUseCase: sl(),
    ),
  );
// Home BLoC
  sl.registerFactory(() => HomeBloc(sl<GetTopTenMoviesTihsWeekUseCase>(),sl<GetPlayingNowMoviesUseCase>(),
  sl<GetTrendingTvShowsUseCase>()
  ));

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

  // Profile Use Cases
  sl.registerLazySingleton(() => CreateProfileUseCase(sl()));
  sl.registerLazySingleton(() => UpdateProfileUseCase(sl()));
  sl.registerLazySingleton(() => GetProfileUseCase(sl()));
  sl.registerLazySingleton(() => CheckProfileExistsUseCase(sl()));
   sl.registerLazySingleton(() => AddFavoriteMovieUseCase(sl()));
  sl.registerLazySingleton(() => RemoveFavoriteMovieUseCase(sl()));
  sl.registerLazySingleton(() => AddWishlistMovieUseCase(sl()));
  sl.registerLazySingleton(() => RemoveWishlistMovieUseCase(sl()));

  // Home use cases
  sl.registerLazySingleton(() =>
   GetTopTenMoviesTihsWeekUseCase(homeRepo: sl<HomeRepo>()));

  sl.registerLazySingleton(() => GetPlayingNowMoviesUseCase(repository: sl<HomeRepo>()));

  sl.registerLazySingleton(() => GetTrendingTvShowsUseCase(repository: sl<HomeRepo>()));

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
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Profile Repository
  sl.registerLazySingleton<ProfileRepository>(
    () =>
        ProfileRepositoryImpl(remoteDataSource: sl(), cloudinaryService: sl()),
  );
   // Home Repository
  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(sl<RemoteHomeServices>()),
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

  // Profile Data Source
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(sl()),
  );
  // Cloudinary Service
  sl.registerLazySingleton<CloudinaryService>(
    () => CloudinaryService(dio: sl()),
  );

  // Home Services
 sl.registerLazySingleton<RemoteHomeServices>(() => RemoteHomeServices(dio));


  // ========== External ==========
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // Firebase Auth
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  // Firestore
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
}
