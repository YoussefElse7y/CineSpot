import '../../domain/entities/app_theme_mode.dart';

abstract class ThemeEvent {
  const ThemeEvent();
}

class LoadThemeEvent extends ThemeEvent {}

class ChangeThemeEvent extends ThemeEvent {
  final AppThemeMode themeMode;

  const ChangeThemeEvent(this.themeMode);
}