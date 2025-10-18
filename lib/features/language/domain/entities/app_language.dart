import 'package:flutter/material.dart';

enum AppLanguage {
  english('en', 'English', 'English'),
  arabic('ar', 'العربية', 'Arabic'),
  french('fr', 'Français', 'French');

  final String code;
  final String nativeName;
  final String englishName;

  const AppLanguage(this.code, this.nativeName, this.englishName);

  Locale get locale => Locale(code);

  String toJson() => code;

  static AppLanguage fromJson(String json) {
    return AppLanguage.values.firstWhere(
      (lang) => lang.code == json,
      orElse: () => AppLanguage.english,
    );
  }

  static AppLanguage fromLocale(Locale locale) {
    return AppLanguage.values.firstWhere(
      (lang) => lang.code == locale.languageCode,
      orElse: () => AppLanguage.english,
    );
  }
}