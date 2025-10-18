import '../../domain/entities/app_theme_mode.dart';

abstract class ThemeState {
  const ThemeState();
}

class ThemeInitial extends ThemeState {}

class ThemeLoading extends ThemeState {}

class ThemeLoaded extends ThemeState {
  final AppThemeMode themeMode;

  const ThemeLoaded(this.themeMode);
}

class ThemeError extends ThemeState {
  final String message;

  const ThemeError(this.message);
}