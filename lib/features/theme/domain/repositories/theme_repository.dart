import '../entities/app_theme_mode.dart';

abstract class ThemeRepository {
  Future<AppThemeMode> getThemeMode();
  Future<void> saveThemeMode(AppThemeMode mode);
}