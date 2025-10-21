class NowPlayingMovieEntity {
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final String originalLanguage;
  final String releaseDate;
  final double popularity;
  final double voteAverage;
  final int voteCount;
  final bool adult;
  final bool video;
  final List<int> genreIds;

  const NowPlayingMovieEntity({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.originalLanguage,
    required this.releaseDate,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
    required this.adult,
    required this.video,
    required this.genreIds,
  });
}
