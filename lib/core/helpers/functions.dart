import 'dart:math';

List<String> getGenreNamesByLanguage(
  List<int> genreIds, {
  String language = 'en', // 'en', 'ar', or 'fr'
}) {
  // Define genres by language
  final Map<String, Map<int, String>> genreMap = {
    'en': {
      28: "Action",
      12: "Adventure",
      16: "Animation",
      35: "Comedy",
      80: "Crime",
      99: "Documentary",
      18: "Drama",
      10751: "Family",
      14: "Fantasy",
      36: "History",
      27: "Horror",
      10402: "Music",
      9648: "Mystery",
      10749: "Romance",
      878: "Science Fiction",
      10770: "TV Movie",
      53: "Thriller",
      10752: "War",
      37: "Western",
    },
    'ar': {
      28: "حركة",
      12: "مغامرة",
      16: "رسوم متحركة",
      35: "كوميديا",
      80: "جريمة",
      99: "وثائقي",
      18: "دراما",
      10751: "عائلي",
      14: "فانتازيا",
      36: "تاريخ",
      27: "رعب",
      10402: "موسيقى",
      9648: "غموض",
      10749: "رومنسية",
      878: "خيال علمي",
      10770: "فيلم تلفازي",
      53: "إثارة",
      10752: "حرب",
      37: "غربي",
    },
    'fr': {
      28: "Action",
      12: "Aventure",
      16: "Animation",
      35: "Comédie",
      80: "Crime",
      99: "Documentaire",
      18: "Drame",
      10751: "Familial",
      14: "Fantastique",
      36: "Histoire",
      27: "Horreur",
      10402: "Musique",
      9648: "Mystère",
      10749: "Romance",
      878: "Science-Fiction",
      10770: "Téléfilm",
      53: "Thriller",
      10752: "Guerre",
      37: "Western",
    },
  };

  // fallback to English if invalid language
  final selectedMap = genreMap[language] ?? genreMap['en']!;

  // map ids to genre names
  return genreIds.map((id) => selectedMap[id] ?? 'Unknown').toList();
}


T getRandomElement<T>(List<T> list) {
  if (list.isEmpty) {
    throw ArgumentError('List cannot be empty');
  }
  final random = Random();
  return list[random.nextInt(list.length)];
}