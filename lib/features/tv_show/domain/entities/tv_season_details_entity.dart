class TvSeasonDetailsEntity {
  final String? airDate;
  final List<TvEpisodeEntity> episodes;
  final String name;
  final String overview;
  final int id;
  final String? posterPath;
  final int seasonNumber;

  TvSeasonDetailsEntity({
    this.airDate,
    required this.episodes,
    required this.name,
    required this.overview,
    required this.id,
    this.posterPath,
    required this.seasonNumber,
  });
}

class TvEpisodeEntity {
  final String? airDate;
  final int episodeNumber;
  final int id;
  final String name;
  final String overview;
  final String? productionCode;
  final int? runtime;
  final int seasonNumber;
  final int showId;
  final String? stillPath;
  final double voteAverage;
  final int voteCount;
  final List<TvCrewEntity> crew;
  final List<TvGuestStarEntity> guestStars;

  TvEpisodeEntity({
    this.airDate,
    required this.episodeNumber,
    required this.id,
    required this.name,
    required this.overview,
    this.productionCode,
    this.runtime,
    required this.seasonNumber,
    required this.showId,
    this.stillPath,
    required this.voteAverage,
    required this.voteCount,
    required this.crew,
    required this.guestStars,
  });
}

class TvCrewEntity {
  final String job;
  final String department;
  final String creditId;
  final int id;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;

  TvCrewEntity({
    required this.job,
    required this.department,
    required this.creditId,
    required this.id,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
  });
}

class TvGuestStarEntity {
  final String character;
  final String creditId;
  final int order;
  final int id;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;

  TvGuestStarEntity({
    required this.character,
    required this.creditId,
    required this.order,
    required this.id,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
  });
}
