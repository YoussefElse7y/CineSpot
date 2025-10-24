class TvShowCreditsEntity {
  final List<TvCastEntity> cast;
  final List<TvCrewEntity> crew;
  final int id;

  TvShowCreditsEntity({
    required this.cast,
    required this.crew,
    required this.id,
  });
}

class TvCastEntity {
  final bool adult;
  final int? gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final List<TvRoleEntity> roles;
  final int totalEpisodeCount;
  final int order;

  TvCastEntity({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    required this.roles,
    required this.totalEpisodeCount,
    required this.order,
  });
}

class TvRoleEntity {
  final String creditId;
  final String character;
  final int episodeCount;

  TvRoleEntity({
    required this.creditId,
    required this.character,
    required this.episodeCount,
  });
}

class TvCrewEntity {
  final bool adult;
  final int? gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final List<TvJobEntity> jobs;
  final String department;
  final int totalEpisodeCount;

  TvCrewEntity({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    required this.jobs,
    required this.department,
    required this.totalEpisodeCount,
  });
}

class TvJobEntity {
  final String creditId;
  final String job;
  final int episodeCount;

  TvJobEntity({
    required this.creditId,
    required this.job,
    required this.episodeCount,
  });
}
