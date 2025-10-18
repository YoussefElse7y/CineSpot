import '../entities/app_theme_mode.dart';
import '../repositories/theme_repository.dart';

class SaveThemeMode {
  final ThemeRepository repository;

  SaveThemeMode(this.repository);

  Future<void> call(AppThemeMode mode) async {
    await repository.saveThemeMode(mode);
  }
}