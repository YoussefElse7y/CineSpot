// Example: Settings Screen with Language Selector
import 'package:cine_spot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/language/domain/entities/app_language.dart';
import '../features/language/presentation/bloc/language_bloc.dart';
import '../features/language/presentation/bloc/language_event.dart';
import '../features/language/presentation/bloc/language_state.dart';
import '../features/theme/domain/entities/app_theme_mode.dart';
import '../features/theme/presentation/bloc/theme_bloc.dart';
import '../features/theme/presentation/bloc/theme_event.dart';


// Example: Home Screen with translations
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        actions: [
          // Quick Language Toggle
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.welcome,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 20),
            // Using translation with parameter
            Text(
              l10n.hello('Ahmed'),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            // Using plural translation
            Text(l10n.itemCount(0)),
            Text(l10n.itemCount(1)),
            Text(l10n.itemCount(5)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SettingsScreen(),
            ),
          );
        },
        child: const Icon(Icons.settings),
      ),
    );
  }
}
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Language Section
          Text(
            l10n.language,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              AppLanguage currentLanguage = AppLanguage.english;
              if (state is LanguageLoaded) {
                currentLanguage = state.language;
              }

              return Column(
                children: AppLanguage.values.map((language) {
                  return RadioListTile<AppLanguage>(
                    title: Text(language.nativeName),
                    subtitle: Text(language.englishName),
                    value: language,
                    groupValue: currentLanguage,
                    onChanged: (value) {
                      if (value != null) {
                        context.read<LanguageBloc>().add(
                              ChangeLanguageEvent(value),
                            );
                      }
                    },
                  );
                }).toList(),
              );
            },
          ),
          
          const Divider(height: 32),
          
          // Theme Section
          Text(
            l10n.theme,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          ListTile(
            title: Text(l10n.lightTheme),
            leading: const Icon(Icons.light_mode),
            onTap: () {
              context.read<ThemeBloc>().add(
                    const ChangeThemeEvent(AppThemeMode.light),
                  );
            },
          ),
          ListTile(
            title: Text(l10n.darkTheme),
            leading: const Icon(Icons.dark_mode),
            onTap: () {
              context.read<ThemeBloc>().add(
                    const ChangeThemeEvent(AppThemeMode.dark),
                  );
            },
          ),
          ListTile(
            title: Text(l10n.systemTheme),
            leading: const Icon(Icons.settings_system_daydream),
            onTap: () {
              context.read<ThemeBloc>().add(
                    const ChangeThemeEvent(AppThemeMode.system),
                  );
            },
          ),
        ],
      ),
    );
  }
}


// Reusable Language Switcher Widget
class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        AppLanguage currentLanguage = AppLanguage.english;
        if (state is LanguageLoaded) {
          currentLanguage = state.language;
        }

        return PopupMenuButton<AppLanguage>(
          icon: const Icon(Icons.language),
          onSelected: (language) {
            context.read<LanguageBloc>().add(
                  ChangeLanguageEvent(language),
                );
          },
          itemBuilder: (context) {
            return AppLanguage.values.map((language) {
              return PopupMenuItem<AppLanguage>(
                value: language,
                child: Row(
                  children: [
                    if (language == currentLanguage)
                      const Icon(Icons.check, size: 20),
                    if (language == currentLanguage)
                      const SizedBox(width: 8),
                    Text(language.nativeName),
                  ],
                ),
              );
            }).toList();
          },
        );
      },
    );
  }
}