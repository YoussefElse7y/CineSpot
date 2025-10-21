class TrendingTvShowEntity {
  final int id;
  final String name;
  final String originalName;
  final String overview;
  final String? backdropPath;
  final String? posterPath;
  final String originalLanguage;
  final String mediaType;
  final List<int> genreIds;
  final List<String> originCountry;
  final double popularity;
  final double voteAverage;
  final int voteCount;
  final bool adult;
  final String firstAirDate;

  const TrendingTvShowEntity({
    required this.id,
    required this.name,
    required this.originalName,
    required this.overview,
    required this.backdropPath,
    required this.posterPath,
    required this.originalLanguage,
    required this.mediaType,
    required this.genreIds,
    required this.originCountry,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
    required this.adult,
    required this.firstAirDate,
  });
}
