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
  String get top_searches_today =>
      'Recherches les plus populaires aujourd\'hui';

  @override
  String get all => 'Tout';

  @override
  String get not_found => 'Introuvable';

  @override
  String get not_found_message =>
      'Désolé. Le mot-clé que vous avez saisi est introuvable. Veuillez réessayer avec d\'autres mots-clés.';

  @override
  String get people => 'Personnes';

  @override
  String get companies => 'Entreprises';

  @override
  String get genres => 'Genres';

  @override
  String get details => 'Détails';

  @override
  String get reviews => 'Avis';

  @override
  String get videos => 'Vidéos';

  @override
  String get recommendations => 'Recommandations';

  @override
  String get similar => 'Similaire';

  @override
  String get cast => 'Distribution';

  @override
  String get crew => 'Équipe';

  @override
  String get seasons => 'Saisons';

  @override
  String get episodes => 'Épisodes';

  @override
  String get episode => 'Épisode';

  @override
  String get season => 'Saison';

  @override
  String get tagline => 'Slogan';

  @override
  String get overview => 'Aperçu';

  @override
  String get release_date => 'Date de sortie';

  @override
  String get first_air => 'Première diffusion';

  @override
  String get last_air_date => 'Dernière diffusion';

  @override
  String get status => 'Statut';

  @override
  String get original_language => 'Langue originale';

  @override
  String get created_by => 'Créé par';

  @override
  String get number_of_seasons => 'Nombre de saisons';

  @override
  String get networks => 'Chaînes';

  @override
  String get read_more => 'Lire plus';

  @override
  String get read_less => 'Lire moins';

  @override
  String get guest_stars => 'Invités spéciaux';

  @override
  String get rating => 'Note';

  @override
  String get run_time => 'Durée';

  @override
  String get budget => 'Budget';

  @override
  String get revenue => 'Revenus';

  @override
  String get production_companies => 'Sociétés de production';

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
