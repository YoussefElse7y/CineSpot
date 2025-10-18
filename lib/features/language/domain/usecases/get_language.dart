import '../entities/app_language.dart';
import '../repositories/language_repository.dart';

class GetLanguage {
  final LanguageRepository repository;

  GetLanguage(this.repository);

  Future<AppLanguage> call() async {
    return await repository.getLanguage();
  }
}