// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get locale_language => 'fr';

  @override
  String get appTitle => 'Mon Application';

  @override
  String get welcome => 'Bienvenue';

  @override
  String hello(String name) {
    return 'Bonjour, $name!';
  }

  @override
  String get lets_you_in => 'Let\'s you in';

  @override
  String get settings => 'Paramètres';

  @override
  String get language => 'Langue';

  @override
  String get theme => 'Thème';

  @override
  String get lightTheme => 'Thème Clair';

  @override
  String get darkTheme => 'Thème Sombre';

  @override
  String get systemTheme => 'Thème Système';

  @override
  String get home => 'Accueil';

  @override
  String get profile => 'Profil';

  @override
  String get logout => 'Déconnexion';

  @override
  String get save => 'Enregistrer';

  @override
  String get cancel => 'Annuler';

  @override
  String get confirm => 'Confirmer';

  @override
  String get delete => 'Supprimer';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count éléments',
      one: '1 élément',
      zero: 'Aucun élément',
    );
    return '$_temp0';
  }

  @override
  String get continue_with_facebook => 'Continue with Facebook';

  @override
  String get continue_with_google => 'Continue with Google';

  @override
  String get continue_with_apple => 'Continue with Apple';
}
