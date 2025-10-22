class MovieSearchResultEntity {
  final int id;
  final String title;
  final String originalTitle;
  final String originalLanguage;
  final String? posterPath;
  final String? backdropPath;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;
  final double popularity;
  final bool adult;
  final bool video;
  final List<int> genreIds;

  const MovieSearchResultEntity({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.originalLanguage,
    this.posterPath,
    this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    required this.adult,
    required this.video,
    required this.genreIds,
  });
}
