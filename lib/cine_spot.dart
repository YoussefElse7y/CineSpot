import 'package:cine_spot/core/routing/app_router.dart';
import 'package:cine_spot/core/routing/routes.dart';
import 'package:cine_spot/core/theme/app_theme.dart';

import 'package:cine_spot/features/language/domain/entities/app_language.dart';
import 'package:cine_spot/features/language/presentation/bloc/language_bloc.dart';
import 'package:cine_spot/features/language/presentation/bloc/language_state.dart';
import 'package:cine_spot/features/theme/domain/entities/app_theme_mode.dart';
import 'package:cine_spot/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:cine_spot/features/theme/presentation/bloc/theme_state.dart';
import 'package:cine_spot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// ignore: must_be_immutable
class CineSpot extends StatelessWidget {
    AppRouter appRouter;

   CineSpot({super.key ,required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, languageState) {
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
            Locale locale = const Locale('en');
            if (languageState is LanguageLoaded) {
              locale = languageState.language.locale;
            }
            return MaterialApp(
              title: 'Flutter App',
              debugShowCheckedModeBanner: false,

              onGenerateTitle: (context) =>
                  AppLocalizations.of(context)!.appTitle,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: themeMode,
              onGenerateRoute: appRouter.generateRoute,
              initialRoute: Routes.landingScreen,
              locale: locale,
              supportedLocales: AppLanguage.values
                  .map((e) => e.locale)
                  .toList(),
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],

            );
          },
        );
      },
    );
  }
}
