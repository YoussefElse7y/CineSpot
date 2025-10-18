import '../../domain/entities/app_theme_mode.dart';
import '../../domain/repositories/theme_repository.dart';
import '../datasources/theme_local_datasource.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDataSource localDataSource;

  ThemeRepositoryImpl({required this.localDataSource});

  @override
  Future<AppThemeMode> getThemeMode() async {
    return await localDataSource.getThemeMode();
  }

  @override
  Future<void> saveThemeMode(AppThemeMode mode) async {
    await localDataSource.saveThemeMode(mode);
  }
}