import '../../domain/entities/app_language.dart';

abstract class LanguageEvent {
  const LanguageEvent();
}

class LoadLanguageEvent extends LanguageEvent {}

class ChangeLanguageEvent extends LanguageEvent {
  final AppLanguage language;

  const ChangeLanguageEvent(this.language);
}