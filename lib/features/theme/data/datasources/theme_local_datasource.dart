import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/app_theme_mode.dart';

abstract class ThemeLocalDataSource {
  Future<AppThemeMode> getThemeMode();
  Future<void> saveThemeMode(AppThemeMode mode);
}

class ThemeLocalDataSourceImpl implements ThemeLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String themeKey = 'THEME_MODE';

  ThemeLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<AppThemeMode> getThemeMode() async {
    final themeModeString = sharedPreferences.getString(themeKey);
    if (themeModeString != null) {
      return AppThemeMode.fromJson(themeModeString);
    }
    return AppThemeMode.system; // Default
  }

  @override
  Future<void> saveThemeMode(AppThemeMode mode) async {
    await sharedPreferences.setString(themeKey, mode.toJson());
  }
}