import '../entities/app_theme_mode.dart';
import '../repositories/theme_repository.dart';

class GetThemeMode {
  final ThemeRepository repository;

  GetThemeMode(this.repository);

  Future<AppThemeMode> call() async {
    return await repository.getThemeMode();
  }
}