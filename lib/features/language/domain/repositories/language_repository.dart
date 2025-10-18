import '../entities/app_language.dart';

abstract class LanguageRepository {
  Future<AppLanguage> getLanguage();
  Future<void> saveLanguage(AppLanguage language);
}