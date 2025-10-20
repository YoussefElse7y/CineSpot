import 'dart:math';

List<String> getGenreNames(List<int> genreIds) {
  final genres = {
    28: "Action",
    12: "Abenteuer",
    16: "Animation",
    35: "Komödie",
    80: "Krimi",
    99: "Dokumentarfilm",
    18: "Drama",
    10751: "Familie",
    14: "Fantasy",
    36: "Historie",
    27: "Horror",
    10402: "Musik",
    9648: "Mystery",
    10749: "Liebesfilm",
    878: "Science Fiction",
    10770: "TV-Film",
    53: "Thriller",
    10752: "Kriegsfilm",
    37: "Western",
  };

  // Map each id to its name if exists
  return genreIds.map((id) => genres[id] ?? 'Unknown').toList();
}

T getRandomElement<T>(List<T> list) {
  if (list.isEmpty) {
    throw ArgumentError('List cannot be empty');
  }
  final random = Random();
  return list[random.nextInt(list.length)];
}