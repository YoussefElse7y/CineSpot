// tv_show_details_model.dart


import 'package:cine_spot/features/tv_show/domain/entities/tv_show_details_entity.dart';

class TvShowDetailsModel extends TvShowDetailsEntity {
  TvShowDetailsModel({
    required int id,
    required String name,
    required String originalName,
    required String overview,
    String? tagline,
    String? backdropPath,
    String? posterPath,
    required String firstAirDate,
    String? lastAirDate,
    required bool inProduction,
    required int numberOfSeasons,
    required int numberOfEpisodes,
    required double voteAverage,
    required int voteCount,
    required List<GenreModel> genres,
    required List<SeasonModel> seasons,
    required List<CreatedByModel> createdBy,
    required List<NetworkModel> networks,
  }) : super(
          id: id,
          name: name,
          originalName: originalName,
          overview: overview,
          tagline: tagline,
          backdropPath: backdropPath,
          posterPath: posterPath,
          firstAirDate: firstAirDate,
          lastAirDate: lastAirDate,
          inProduction: inProduction,
          numberOfSeasons: numberOfSeasons,
          numberOfEpisodes: numberOfEpisodes,
          voteAverage: voteAverage,
          voteCount: voteCount,
          genres: genres,
          seasons: seasons,
          createdBy: createdBy,
          networks: networks,
        );

  factory TvShowDetailsModel.fromJson(Map<String, dynamic> json) {
    return TvShowDetailsModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      originalName: json['original_name'] ?? '',
      overview: json['overview'] ?? '',
      tagline: json['tagline'],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      firstAirDate: json['first_air_date'] ?? '',
      lastAirDate: json['last_air_date'],
      inProduction: json['in_production'] ?? false,
      numberOfSeasons: json['number_of_seasons'] ?? 0,
      numberOfEpisodes: json['number_of_episodes'] ?? 0,
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
      genres: (json['genres'] as List<dynamic>? ?? [])
          .map((e) => GenreModel.fromJson(e))
          .toList(),
      seasons: (json['seasons'] as List<dynamic>? ?? [])
          .map((e) => SeasonModel.fromJson(e))
          .toList(),
      createdBy: (json['created_by'] as List<dynamic>? ?? [])
          .map((e) => CreatedByModel.fromJson(e))
          .toList(),
      networks: (json['networks'] as List<dynamic>? ?? [])
          .map((e) => NetworkModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'original_name': originalName,
      'overview': overview,
      'tagline': tagline,
      'backdrop_path': backdropPath,
      'poster_path': posterPath,
      'first_air_date': firstAirDate,
      'last_air_date': lastAirDate,
      'in_production': inProduction,
      'number_of_seasons': numberOfSeasons,
      'number_of_episodes': numberOfEpisodes,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'genres': genres.map((e) => (e as GenreModel).toJson()).toList(),
      'seasons': seasons.map((e) => (e as SeasonModel).toJson()).toList(),
      'created_by': createdBy.map((e) => (e as CreatedByModel).toJson()).toList(),
      'networks': networks.map((e) => (e as NetworkModel).toJson()).toList(),
    };
  }

  TvShowDetailsEntity toEntity() {
    return TvShowDetailsEntity(
      id: id,
      name: name,
      originalName: originalName,
      overview: overview,
      tagline: tagline,
      backdropPath: backdropPath,
      posterPath: posterPath,
      firstAirDate: firstAirDate,
      lastAirDate: lastAirDate,
      inProduction: inProduction,
      numberOfSeasons: numberOfSeasons,
      numberOfEpisodes: numberOfEpisodes,
      voteAverage: voteAverage,
      voteCount: voteCount,
      genres: genres.map((e) => (e as GenreModel).toEntity()).toList(),
      seasons: seasons.map((e) => (e as SeasonModel).toEntity()).toList(),
      createdBy: createdBy.map((e) => (e as CreatedByModel).toEntity()).toList(),
      networks: networks.map((e) => (e as NetworkModel).toEntity()).toList(),
    );
  }
}

class GenreModel extends GenreEntity {
  GenreModel({required int id, required String name}) : super(id: id, name: name);

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  GenreEntity toEntity() => GenreEntity(id: id, name: name);
}

class SeasonModel extends SeasonEntity {
  SeasonModel({
    required int id,
    required String name,
    String? overview,
    String? posterPath,
    String? airDate,
    required int episodeCount,
    required int seasonNumber,
    required double voteAverage,
  }) : super(
          id: id,
          name: name,
          overview: overview,
          posterPath: posterPath,
          airDate: airDate,
          episodeCount: episodeCount,
          seasonNumber: seasonNumber,
          voteAverage: voteAverage,
        );

  factory SeasonModel.fromJson(Map<String, dynamic> json) {
    return SeasonModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      overview: json['overview'],
      posterPath: json['poster_path'],
      airDate: json['air_date'],
      episodeCount: json['episode_count'] ?? 0,
      seasonNumber: json['season_number'] ?? 0,
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'overview': overview,
        'poster_path': posterPath,
        'air_date': airDate,
        'episode_count': episodeCount,
        'season_number': seasonNumber,
        'vote_average': voteAverage,
      };

  SeasonEntity toEntity() => SeasonEntity(
        id: id,
        name: name,
        overview: overview,
        posterPath: posterPath,
        airDate: airDate,
        episodeCount: episodeCount,
        seasonNumber: seasonNumber,
        voteAverage: voteAverage,
      );
}

class CreatedByModel extends CreatedByEntity {
  CreatedByModel({required int id, required String name, int? gender, String? profilePath})
      : super(id: id, name: name, gender: gender, profilePath: profilePath);

  factory CreatedByModel.fromJson(Map<String, dynamic> json) {
    return CreatedByModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      gender: json['gender'],
      profilePath: json['profile_path'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'gender': gender,
        'profile_path': profilePath,
      };

  CreatedByEntity toEntity() => CreatedByEntity(
        id: id,
        name: name,
        gender: gender,
        profilePath: profilePath,
      );
}

class NetworkModel extends NetworkEntity {
  NetworkModel({required int id, required String name, String? logoPath, required String originCountry})
      : super(id: id, name: name, logoPath: logoPath, originCountry: originCountry);

  factory NetworkModel.fromJson(Map<String, dynamic> json) {
    return NetworkModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      logoPath: json['logo_path'],
      originCountry: json['origin_country'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'logo_path': logoPath,
        'origin_country': originCountry,
      };

  NetworkEntity toEntity() => NetworkEntity(
        id: id,
        name: name,
        logoPath: logoPath,
        originCountry: originCountry,
      );
}
