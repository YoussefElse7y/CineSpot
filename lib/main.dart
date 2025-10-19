import 'package:cine_spot/cine_spot.dart';
import 'package:cine_spot/core/routing/app_router.dart';
import 'package:cine_spot/features/auth/presentation/bloc/auth_bloc.dart';
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
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
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
        BlocProvider(create: (context) => di.sl<AuthBloc>()..add(CheckAuthStatus()),)
      ],
      child:  CineSpot(appRouter: AppRouter(),),
    );
  }
}

