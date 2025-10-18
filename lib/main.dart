
// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/injection_container.dart' as di;
import 'core/theme/app_theme.dart';
import 'features/theme/domain/entities/app_theme_mode.dart';
import 'features/theme/presentation/bloc/theme_bloc.dart';
import 'features/theme/presentation/bloc/theme_event.dart';
import 'features/theme/presentation/bloc/theme_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocProvider at the ROOT level - accessible throughout the entire app
    return BlocProvider(
      create: (context) => di.sl<ThemeBloc>()..add(LoadThemeEvent()),
      child: const AppView(),
    );
  }
}

// Separate widget to rebuild when theme changes
class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocBuilder listens to ThemeBloc changes and rebuilds MaterialApp
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        ThemeMode themeMode = ThemeMode.system;
        
        if (state is ThemeLoaded) {
          switch (state.themeMode) {
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

        return MaterialApp(
          title: 'Flutter Theme Demo',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeMode, // This updates entire app theme
          home: const HomeScreen(),
          // If you use named routes, add them here
          // routes: {
          //   '/home': (context) => const HomeScreen(),
          //   '/settings': (context) => const SettingsScreen(),
          // },
        );
      },
    );
  }
}

// Example usage in a screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Choose Theme Mode:'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<ThemeBloc>().add(
                      const ChangeThemeEvent(AppThemeMode.light),
                    );
              },
              child: const Text('Light Theme'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.read<ThemeBloc>().add(
                      const ChangeThemeEvent(AppThemeMode.dark),
                    );
              },
              child: const Text('Dark Theme'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.read<ThemeBloc>().add(
                      const ChangeThemeEvent(AppThemeMode.system),
                    );
              },
              child: const Text('System Theme'),
            ),
          ],
        ),
      ),
    );
  }
}