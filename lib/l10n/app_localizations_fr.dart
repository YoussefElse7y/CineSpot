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
  String get native_language => 'Français';

  @override
  String get appTitle => 'CineSpot';

  @override
  String get welcome => 'Bienvenue';

  @override
  String hello(String name) {
    return 'Bonjour, $name!';
  }

  @override
  String get lets_you_in => 'Laissez-vous entrer';

  @override
  String get settings => 'Paramètres';

  @override
  String get language => 'Langue';

  @override
  String get theme => 'Thème';

  @override
  String get lightTheme => 'Thème clair';

  @override
  String get darkTheme => 'Thème sombre';

  @override
  String get systemTheme => 'Thème du système';

  @override
  String get editProfile => 'Modifier le profil';

  @override
  String get notifications => 'Notifications';

  @override
  String get help => 'Aide';

  @override
  String get download => 'Download';

  @override
  String get about => 'À propos';

  @override
  String get security => 'Sécurité';

  @override
  String get english => 'Anglais';

  @override
  String get arabic => 'Arabe';

  @override
  String get french => 'Français';

  @override
  String get myList => 'Ma liste';

  @override
  String get explore => 'Explorer';

  @override
  String get downloads => 'Téléchargements';

  @override
  String get joinPremium => 'Rejoindre Premium';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get termsOfService => 'Conditions d\'utilisation';

  @override
  String get helpCenter => 'Centre d\'aide';

  @override
  String get signIn => 'Se connecter';

  @override
  String get signUp => 'S\'inscrire';

  @override
  String get topMoviesThisWeek => 'Meilleurs films de la semaine';

  @override
  String get topTvShowsThisWeek => 'Meilleures séries de la semaine';

  @override
  String get popularMovies => 'Films populaires';

  @override
  String get popularTvShows => 'Séries populaires';

  @override
  String get trendingMovies => 'Films tendances';

  @override
  String get trendingTvShows => 'Séries tendances';

  @override
  String get topRatedMovies => 'Films les mieux notés';

  @override
  String get nowPlaying => 'En salle';

  @override
  String get upcoming => 'À venir';

  @override
  String get topRatedTvShows => 'Séries les mieux notées';

  @override
  String get movies => 'Films';

  @override
  String get tvShows => 'Séries';

  @override
  String get search => 'Recherche';

  @override
  String get movie => 'Film';

  @override
  String get tvShow => 'Série';

  @override
  String get movieDetails => 'Détails du film';

  @override
  String get tvShowDetails => 'Détails de la série';

  @override
  String get play => 'Lire';

  @override
  String get seeAll => 'Voir tout';

  @override
  String get home => 'Accueil';

  @override
  String get profile => 'Profil';

  @override
  String get logout => 'Déconnexion';

  @override
  String get logoutConfirmation =>
      'Êtes-vous sûr de vouloir vous déconnecter ?';

  @override
  String get save => 'Enregistrer';

  @override
  String get cancel => 'Annuler';

  @override
  String get confirm => 'Confirmer';

  @override
  String get delete => 'Supprimer';

  @override
  String get suggested => 'Suggéré';

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
  String get continue_with_facebook => 'Continuer avec Facebook';

  @override
  String get continue_with_google => 'Continuer avec Google';

  @override
  String get continue_with_apple => 'Continuer avec Apple';
}
