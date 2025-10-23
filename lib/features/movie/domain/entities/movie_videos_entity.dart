class MovieVideosEntity {
  final int id;
  final List<MovieVideoEntity> results;

  MovieVideosEntity({
    required this.id,
    required this.results,
  });
}

class MovieVideoEntity {
  final String? iso6391;
  final String? iso31661;
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool? official;
  final DateTime? publishedAt;
  final String id;

  MovieVideoEntity({
    this.iso6391,
    this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    this.official,
    this.publishedAt,
    required this.id,
  });
}
