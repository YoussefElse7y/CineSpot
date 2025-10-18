import '../../domain/entities/app_language.dart';

abstract class LanguageState {
  const LanguageState();
}

class LanguageInitial extends LanguageState {}

class LanguageLoading extends LanguageState {}

class LanguageLoaded extends LanguageState {
  final AppLanguage language;

  const LanguageLoaded(this.language);
}

class LanguageError extends LanguageState {
  final String message;

  const LanguageError(this.message);
}