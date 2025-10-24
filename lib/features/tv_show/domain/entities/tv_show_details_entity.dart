class TvShowDetailsEntity {
  final int id;
  final String name;
  final String originalName;
  final String overview;
  final String? tagline;
  final String? backdropPath;
  final String? posterPath;
  final String firstAirDate;
  final String? lastAirDate;
  final bool inProduction;
  final int numberOfSeasons;
  final int numberOfEpisodes;
  final double voteAverage;
  final int voteCount;
  final List<GenreEntity> genres;
  final List<SeasonEntity> seasons;
  final List<CreatedByEntity> createdBy;
  final List<NetworkEntity> networks;

  TvShowDetailsEntity({
    required this.id,
    required this.name,
    required this.originalName,
    required this.overview,
    required this.firstAirDate,
    required this.inProduction,
    required this.numberOfSeasons,
    required this.numberOfEpisodes,
    required this.voteAverage,
    required this.voteCount,
    required this.genres,
    required this.seasons,
    required this.createdBy,
    required this.networks,
    this.tagline,
    this.backdropPath,
    this.posterPath,
    this.lastAirDate,
  });
}

class GenreEntity {
  final int id;
  final String name;

  GenreEntity({required this.id, required this.name});
}

class SeasonEntity {
  final int id;
  final String name;
  final String? overview;
  final String? posterPath;
  final String? airDate;
  final int episodeCount;
  final int seasonNumber;
  final double voteAverage;

  SeasonEntity({
    required this.id,
    required this.name,
    this.overview,
    this.posterPath,
    this.airDate,
    required this.episodeCount,
    required this.seasonNumber,
    required this.voteAverage,
  });
}

class CreatedByEntity {
  final int id;
  final String name;
  final int? gender;
  final String? profilePath;

  CreatedByEntity({
    required this.id,
    required this.name,
    this.gender,
    this.profilePath,
  });
}

class NetworkEntity {
  final int id;
  final String name;
  final String? logoPath;
  final String originCountry;

  NetworkEntity({
    required this.id,
    required this.name,
    this.logoPath,
    required this.originCountry,
  });
}
