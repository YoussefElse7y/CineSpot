import '../../domain/entities/app_language.dart';
import '../../domain/repositories/language_repository.dart';
import '../datasources/language_local_datasource.dart';

class LanguageRepositoryImpl implements LanguageRepository {
  final LanguageLocalDataSource localDataSource;

  LanguageRepositoryImpl({required this.localDataSource});

  @override
  Future<AppLanguage> getLanguage() async {
    return await localDataSource.getLanguage();
  }

  @override
  Future<void> saveLanguage(AppLanguage language) async {
    await localDataSource.saveLanguage(language);
  }
}