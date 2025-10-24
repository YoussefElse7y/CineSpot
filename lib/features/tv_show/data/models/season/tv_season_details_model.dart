// tv_season_details_model.dart

import '../../../domain/entities/tv_season_details_entity.dart';

class TvSeasonDetailsModel extends TvSeasonDetailsEntity {
  TvSeasonDetailsModel({
    super.airDate,
    required List<TvEpisodeModel> super.episodes,
    required super.name,
    required super.overview,
    required super.id,
    super.posterPath,
    required super.seasonNumber,
  });

  factory TvSeasonDetailsModel.fromJson(Map<String, dynamic> json) {
    return TvSeasonDetailsModel(
      airDate: json['air_date'] as String?,
      episodes: (json['episodes'] as List<dynamic>)
          .map((e) => TvEpisodeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      overview: json['overview'] as String,
      id: json['id'] as int,
      posterPath: json['poster_path'] as String?,
      seasonNumber: json['season_number'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'air_date': airDate,
        'episodes':
            episodes.map((e) => (e as TvEpisodeModel).toJson()).toList(),
        'name': name,
        'overview': overview,
        'id': id,
        'poster_path': posterPath,
        'season_number': seasonNumber,
      };

  TvSeasonDetailsEntity toEntity() => TvSeasonDetailsEntity(
        airDate: airDate,
        episodes: episodes.map((e) => (e as TvEpisodeModel).toEntity()).toList(),
        name: name,
        overview: overview,
        id: id,
        posterPath: posterPath,
        seasonNumber: seasonNumber,
      );
}

class TvEpisodeModel extends TvEpisodeEntity {
  TvEpisodeModel({
    String? airDate,
    required int episodeNumber,
    required int id,
    required String name,
    required String overview,
    String? productionCode,
    int? runtime,
    required int seasonNumber,
    required int showId,
    String? stillPath,
    required double voteAverage,
    required int voteCount,
    required List<TvCrewModel> crew,
    required List<TvGuestStarModel> guestStars,
  }) : super(
          airDate: airDate,
          episodeNumber: episodeNumber,
          id: id,
          name: name,
          overview: overview,
          productionCode: productionCode,
          runtime: runtime,
          seasonNumber: seasonNumber,
          showId: showId,
          stillPath: stillPath,
          voteAverage: voteAverage,
          voteCount: voteCount,
          crew: crew,
          guestStars: guestStars,
        );

  factory TvEpisodeModel.fromJson(Map<String, dynamic> json) {
    return TvEpisodeModel(
      airDate: json['air_date'] as String?,
      episodeNumber: json['episode_number'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      overview: json['overview'] as String,
      productionCode: json['production_code'] as String?,
      runtime: json['runtime'] as int?,
      seasonNumber: json['season_number'] as int,
      showId: json['show_id'] as int,
      stillPath: json['still_path'] as String?,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
      crew: (json['crew'] as List<dynamic>)
          .map((e) => TvCrewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      guestStars: (json['guest_stars'] as List<dynamic>)
          .map((e) => TvGuestStarModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'air_date': airDate,
        'episode_number': episodeNumber,
        'id': id,
        'name': name,
        'overview': overview,
        'production_code': productionCode,
        'runtime': runtime,
        'season_number': seasonNumber,
        'show_id': showId,
        'still_path': stillPath,
        'vote_average': voteAverage,
        'vote_count': voteCount,
        'crew': crew.map((e) => (e as TvCrewModel).toJson()).toList(),
        'guest_stars':
            guestStars.map((e) => (e as TvGuestStarModel).toJson()).toList(),
      };

  TvEpisodeEntity toEntity() => TvEpisodeEntity(
        airDate: airDate,
        episodeNumber: episodeNumber,
        id: id,
        name: name,
        overview: overview,
        productionCode: productionCode,
        runtime: runtime,
        seasonNumber: seasonNumber,
        showId: showId,
        stillPath: stillPath,
        voteAverage: voteAverage,
        voteCount: voteCount,
        crew: crew.map((e) => (e as TvCrewModel).toEntity()).toList(),
        guestStars: guestStars.map((e) => (e as TvGuestStarModel ).toEntity()).toList(),
      );
}

class TvCrewModel extends TvCrewEntity {
  TvCrewModel({
    required String job,
    required String department,
    required String creditId,
    required int id,
    required String name,
    required String originalName,
    required double popularity,
    String? profilePath,
  }) : super(
          job: job,
          department: department,
          creditId: creditId,
          id: id,
          name: name,
          originalName: originalName,
          popularity: popularity,
          profilePath: profilePath,
        );

  factory TvCrewModel.fromJson(Map<String, dynamic> json) {
    return TvCrewModel(
      job: json['job'] as String,
      department: json['department'] as String,
      creditId: json['credit_id'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      profilePath: json['profile_path'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'job': job,
        'department': department,
        'credit_id': creditId,
        'id': id,
        'name': name,
        'original_name': originalName,
        'popularity': popularity,
        'profile_path': profilePath,
      };

  TvCrewEntity toEntity() => TvCrewEntity(
        job: job,
        department: department,
        creditId: creditId,
        id: id,
        name: name,
        originalName: originalName,
        popularity: popularity,
        profilePath: profilePath,
      );
}

class TvGuestStarModel extends TvGuestStarEntity {
  TvGuestStarModel({
    required String character,
    required String creditId,
    required int order,
    required int id,
    required String name,
    required String originalName,
    required double popularity,
    String? profilePath,
  }) : super(
          character: character,
          creditId: creditId,
          order: order,
          id: id,
          name: name,
          originalName: originalName,
          popularity: popularity,
          profilePath: profilePath,
        );

  factory TvGuestStarModel.fromJson(Map<String, dynamic> json) {
    return TvGuestStarModel(
      character: json['character'] as String,
      creditId: json['credit_id'] as String,
      order: json['order'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      profilePath: json['profile_path'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'character': character,
        'credit_id': creditId,
        'order': order,
        'id': id,
        'name': name,
        'original_name': originalName,
        'popularity': popularity,
        'profile_path': profilePath,
      };

  TvGuestStarEntity toEntity() => TvGuestStarEntity(
        character: character,
        creditId: creditId,
        order: order,
        id: id,
        name: name,
        originalName: originalName,
        popularity: popularity,
        profilePath: profilePath,
      );
}
