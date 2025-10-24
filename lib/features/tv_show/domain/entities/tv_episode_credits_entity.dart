class TvEpisodeCreditsEntity {
  final List<dynamic> cast;
  final List<dynamic> crew;
  final List<dynamic> guestStars;
  final int id;

  const TvEpisodeCreditsEntity({
    required this.cast,
    required this.crew,
    required this.guestStars,
    required this.id,
  });
}

class TvEpisodeCastEntity {
  final bool adult;
  final int? gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final String character;
  final String creditId;
  final int order;

  const TvEpisodeCastEntity({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    required this.character,
    required this.creditId,
    required this.order,
  });
}

class TvEpisodeCrewEntity {
  final String department;
  final String job;
  final String creditId;
  final bool adult;
  final int? gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;

  const TvEpisodeCrewEntity({
    required this.department,
    required this.job,
    required this.creditId,
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
  });
}

class TvEpisodeGuestStarEntity {
  final String character;
  final String creditId;
  final int order;
  final bool adult;
  final int? gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;

  const TvEpisodeGuestStarEntity({
    required this.character,
    required this.creditId,
    required this.order,
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
  });
}
