import '../entities/app_language.dart';
import '../repositories/language_repository.dart';

class SaveLanguage {
  final LanguageRepository repository;

  SaveLanguage(this.repository);

  Future<void> call(AppLanguage language) async {
    await repository.saveLanguage(language);
  }
}