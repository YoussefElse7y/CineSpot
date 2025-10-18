// main.dart - UPDATED VERSION
import 'package:cine_spot/home_screnn.dart';
import 'package:cine_spot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/di/injection_container.dart' as di;
import 'core/theme/app_theme.dart';
import 'features/theme/domain/entities/app_theme_mode.dart';
import 'features/theme/presentation/bloc/theme_bloc.dart';
import 'features/theme/presentation/bloc/theme_event.dart';
import 'features/theme/presentation/bloc/theme_state.dart';
import 'features/language/domain/entities/app_language.dart';
import 'features/language/presentation/bloc/language_bloc.dart';
import 'features/language/presentation/bloc/language_event.dart';
import 'features/language/presentation/bloc/language_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Both BLoCs at ROOT level - accessible throughout entire app
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<ThemeBloc>()..add(LoadThemeEvent()),
        ),
        BlocProvider(
          create: (context) => di.sl<LanguageBloc>()..add(LoadLanguageEvent()),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    // Listen to both Theme and Language changes
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, languageState) {
            // Determine theme mode
            ThemeMode themeMode = ThemeMode.system;
            if (themeState is ThemeLoaded) {
              switch (themeState.themeMode) {
                case AppThemeMode.light:
                  themeMode = ThemeMode.light;
                  break;
                case AppThemeMode.dark:
                  themeMode = ThemeMode.dark;
                  break;
                case AppThemeMode.system:
                  themeMode = ThemeMode.system;
                  break;
              }
            }

            // Determine locale
            Locale locale = const Locale('en');
            if (languageState is LanguageLoaded) {
              locale = languageState.language.locale;
            }

            return MaterialApp(
              title: 'Flutter App',
              
              // Theme configuration
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: themeMode,
              
              // Localization configuration
              locale: locale,
              supportedLocales: AppLanguage.values.map((e) => e.locale).toList(),
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              
              home: const HomeScreen(),
            );
          },
        );
      },
    );
  }
}