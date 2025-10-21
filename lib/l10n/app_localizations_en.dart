// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get locale_language => 'en';

  @override
  String get native_language => 'English';

  @override
  String get appTitle => 'CineSpot';

  @override
  String get welcome => 'Welcome';

  @override
  String hello(String name) {
    return 'Hello, $name!';
  }

  @override
  String get lets_you_in => 'Let\'s you in';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get theme => 'Theme';

  @override
  String get lightTheme => 'Light Theme';

  @override
  String get darkTheme => 'Dark Theme';

  @override
  String get systemTheme => 'System Theme';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get notifications => 'Notifications';

  @override
  String get help => 'Help';

  @override
  String get download => 'Download';

  @override
  String get about => 'About';

  @override
  String get security => 'Security';

  @override
  String get english => 'English';

  @override
  String get arabic => 'Arabic';

  @override
  String get french => 'French';

  @override
  String get myList => 'My List';

  @override
  String get explore => 'Explore';

  @override
  String get downloads => 'Downloads';

  @override
  String get joinPremium => 'Join Premium';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get helpCenter => 'Help Center';

  @override
  String get signIn => 'Sign In';

  @override
  String get signUp => 'Sign Up';

  @override
  String get topMoviesThisWeek => 'Top Movies This Week';

  @override
  String get topTvShowsThisWeek => 'Top Tv Shows This Week';

  @override
  String get popularMovies => 'Popular Movies';

  @override
  String get popularTvShows => 'Popular Tv Shows';

  @override
  String get trendingMovies => 'Trending Movies';

  @override
  String get trendingTvShows => 'Trending Tv Shows';

  @override
  String get topRatedMovies => 'Top Rated Movies';

  @override
  String get nowPlaying => 'Now Playing';

  @override
  String get upcoming => 'Upcoming';

  @override
  String get topRatedTvShows => 'Top Rated Tv Shows';

  @override
  String get movies => 'Movies';

  @override
  String get tvShows => 'Tv Shows';

  @override
  String get search => 'Search';

  @override
  String get movie => 'Movie';

  @override
  String get tvShow => 'Tv Show';

  @override
  String get movieDetails => 'Movie Details';

  @override
  String get tvShowDetails => 'Tv Show Details';

  @override
  String get play => 'Play';

  @override
  String get seeAll => 'See All';

  @override
  String get home => 'Home';

  @override
  String get profile => 'Profile';

  @override
  String get logout => 'Logout';

  @override
  String get logoutConfirmation => 'Are you sure you want to log out?';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get delete => 'Delete';

  @override
  String get suggested => 'Suggested';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
      zero: 'No items',
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
