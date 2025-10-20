import 'package:cine_spot/cine_spot.dart';
import 'package:cine_spot/core/routing/app_router.dart';
import 'package:cine_spot/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cine_spot/features/home/presentation/bloc/home_bloc.dart';
import 'package:cine_spot/features/language/presentation/bloc/language_state.dart';
import 'package:cine_spot/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:cine_spot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/injection_container.dart' as di;
import 'features/theme/presentation/bloc/theme_bloc.dart';
import 'features/theme/presentation/bloc/theme_event.dart';
import 'features/language/presentation/bloc/language_bloc.dart';
import 'features/language/presentation/bloc/language_event.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.init();
  runApp(const CineSpotApp());
}

class CineSpotApp extends StatelessWidget {
  const CineSpotApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<ThemeBloc>()..add(LoadThemeEvent()),
        ),
        BlocProvider(
          create: (context) => di.sl<LanguageBloc>()..add(LoadLanguageEvent()),
        ),
        BlocProvider(
          create: (context) => di.sl<AuthBloc>()..add(CheckAuthStatus()),
        ),
        BlocProvider(create: (context) => di.sl<ProfileBloc>()),

        BlocProvider(
          create: (context) {
            final langBloc = context.read<LanguageBloc>();
            final currentLanguage = (langBloc.state is LanguageLoaded)
                ? (langBloc.state as LanguageLoaded).language.code
                : 'en';
            return di.sl<HomeBloc>()
              ..add(HomeEvent.getTopTenMovies(currentLanguage));
          },
        ),
      ],
      child: CineSpot(appRouter: AppRouter())
          );
   
     
    
  }
}
