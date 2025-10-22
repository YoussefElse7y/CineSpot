class SearchResultEntity {
  final int id;
  final bool adult;
  final String mediaType;
  final String? title;
  final String? name;
  final String? originalTitle;
  final String? originalName;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final String originalLanguage;
  final List<int>? genreIds;
  final List<String>? originCountry;
  final String? releaseDate;
  final String? firstAirDate;
  final double popularity;
  final double voteAverage;
  final int voteCount;
  final bool? video;
  final int? gender;
  final String? knownForDepartment;
  final String? profilePath;
  final List<KnownForEntity>? knownFor;

  const SearchResultEntity({
    required this.id,
    required this.adult,
    required this.mediaType,
    this.title,
    this.name,
    this.originalTitle,
    this.originalName,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    required this.originalLanguage,
    this.genreIds,
    this.originCountry,
    this.releaseDate,
    this.firstAirDate,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
    this.video,
    this.gender,
    this.knownForDepartment,
    this.profilePath,
    this.knownFor,
  });
}

class KnownForEntity {
  final int id;
  final String? title;
  final String? originalTitle;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final String mediaType;
  final String originalLanguage;
  final List<int>? genreIds;
  final String? releaseDate;
  final bool? video;
  final double popularity;
  final double voteAverage;
  final int voteCount;

  const KnownForEntity({
    required this.id,
    this.title,
    this.originalTitle,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    required this.mediaType,
    required this.originalLanguage,
    this.genreIds,
    this.releaseDate,
    this.video,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
  });
}
