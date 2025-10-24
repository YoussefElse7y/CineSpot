// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvShowDetailsModel _$TvShowDetailsModelFromJson(Map<String, dynamic> json) =>
    TvShowDetailsModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      overview: json['overview'] as String,
      firstAirDate: json['first_air_date'] as String,
      inProduction: json['in_production'] as bool,
      numberOfSeasons: (json['number_of_seasons'] as num).toInt(),
      numberOfEpisodes: (json['number_of_episodes'] as num).toInt(),
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: (json['vote_count'] as num).toInt(),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      seasons: (json['seasons'] as List<dynamic>)
          .map((e) => SeasonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdBy: (json['created_by'] as List<dynamic>)
          .map((e) => CreatedByModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      networks: (json['networks'] as List<dynamic>)
          .map((e) => NetworkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tagline: json['tagline'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      posterPath: json['poster_path'] as String?,
      lastAirDate: json['last_air_date'] as String?,
    );

Map<String, dynamic> _$TvShowDetailsModelToJson(TvShowDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'original_name': instance.originalName,
      'overview': instance.overview,
      'tagline': instance.tagline,
      'backdrop_path': instance.backdropPath,
      'poster_path': instance.posterPath,
      'first_air_date': instance.firstAirDate,
      'last_air_date': instance.lastAirDate,
      'in_production': instance.inProduction,
      'number_of_seasons': instance.numberOfSeasons,
      'number_of_episodes': instance.numberOfEpisodes,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'genres': instance.genres.map((e) => e.toJson()).toList(),
      'seasons': instance.seasons.map((e) => e.toJson()).toList(),
      'created_by': instance.createdBy.map((e) => e.toJson()).toList(),
      'networks': instance.networks.map((e) => e.toJson()).toList(),
    };

GenreModel _$GenreModelFromJson(Map<String, dynamic> json) =>
    GenreModel(id: (json['id'] as num).toInt(), name: json['name'] as String);

Map<String, dynamic> _$GenreModelToJson(GenreModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

SeasonModel _$SeasonModelFromJson(Map<String, dynamic> json) => SeasonModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  overview: json['overview'] as String?,
  posterPath: json['poster_path'] as String?,
  airDate: json['air_date'] as String?,
  episodeCount: (json['episode_count'] as num).toInt(),
  seasonNumber: (json['season_number'] as num).toInt(),
  voteAverage: (json['vote_average'] as num).toDouble(),
);

Map<String, dynamic> _$SeasonModelToJson(SeasonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'air_date': instance.airDate,
      'episode_count': instance.episodeCount,
      'season_number': instance.seasonNumber,
      'vote_average': instance.voteAverage,
    };

CreatedByModel _$CreatedByModelFromJson(Map<String, dynamic> json) =>
    CreatedByModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      gender: (json['gender'] as num?)?.toInt(),
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$CreatedByModelToJson(CreatedByModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'profile_path': instance.profilePath,
    };

NetworkModel _$NetworkModelFromJson(Map<String, dynamic> json) => NetworkModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  logoPath: json['logo_path'] as String?,
  originCountry: json['origin_country'] as String,
);

Map<String, dynamic> _$NetworkModelToJson(NetworkModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo_path': instance.logoPath,
      'origin_country': instance.originCountry,
    };
