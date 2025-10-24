class TvSeasonVideosEntity {
  final int id;
  final List<dynamic> results;

  const TvSeasonVideosEntity({
    required this.id,
    required this.results,
  });
}

class TvSeasonVideoItemEntity {
  final String iso6391;
  final String iso31661;
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  final String? publishedAt;
  final String id;

  const TvSeasonVideoItemEntity({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    this.publishedAt,
    required this.id,
  });
}
