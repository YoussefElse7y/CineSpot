class PersonSearchEntity {
  final int id;
  final String name;
  final String originalName;
  final bool adult;
  final int gender;
  final String knownForDepartment;
  final double popularity;
  final String? profilePath;
  final List<KnownForEntity> knownFor;

  const PersonSearchEntity({
    required this.id,
    required this.name,
    required this.originalName,
    required this.adult,
    required this.gender,
    required this.knownForDepartment,
    required this.popularity,
    this.profilePath,
    required this.knownFor,
  });
}

class KnownForEntity {
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final String originalLanguage;
  final List<int> genreIds;
  final String mediaType;
  final double popularity;
  final String? releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;

  const KnownForEntity({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    required this.originalLanguage,
    required this.genreIds,
    required this.mediaType,
    required this.popularity,
    this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
}
