import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/app_language.dart';

abstract class LanguageLocalDataSource {
  Future<AppLanguage> getLanguage();
  Future<void> saveLanguage(AppLanguage language);
}

class LanguageLocalDataSourceImpl implements LanguageLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String languageKey = 'LANGUAGE_CODE';

  LanguageLocalDataSourceImpl({required this.sharedPreferences});
  
  @override
  Future<AppLanguage> getLanguage() async {
    final languageCode = sharedPreferences.getString(languageKey);
      final systemLocale = PlatformDispatcher.instance.locale;
    final systemLanguageCode = systemLocale.languageCode;
    if (languageCode != null) {
      return AppLanguage.fromJson(languageCode);
    }
    if (systemLanguageCode == 'ar') {
      return AppLanguage.arabic;
    }
    if (systemLanguageCode == 'fr') {
      return AppLanguage.french;
    }
    return AppLanguage.english; 
  }

  @override
  Future<void> saveLanguage(AppLanguage language) async {
    await sharedPreferences.setString(languageKey, language.toJson());
  }
}