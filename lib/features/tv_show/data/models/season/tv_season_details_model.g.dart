// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_season_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvSeasonDetailsModel _$TvSeasonDetailsModelFromJson(
  Map<String, dynamic> json,
) => TvSeasonDetailsModel(
  airDate: json['air_date'] as String?,
  episodes: (json['episodes'] as List<dynamic>)
      .map((e) => TvEpisodeModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String,
  overview: json['overview'] as String,
  id: (json['id'] as num).toInt(),
  posterPath: json['poster_path'] as String?,
  seasonNumber: (json['season_number'] as num).toInt(),
);

Map<String, dynamic> _$TvSeasonDetailsModelToJson(
  TvSeasonDetailsModel instance,
) => <String, dynamic>{
  'air_date': instance.airDate,
  'episodes': instance.episodes,
  'name': instance.name,
  'overview': instance.overview,
  'id': instance.id,
  'poster_path': instance.posterPath,
  'season_number': instance.seasonNumber,
};

TvEpisodeModel _$TvEpisodeModelFromJson(Map<String, dynamic> json) =>
    TvEpisodeModel(
      airDate: json['air_date'] as String?,
      episodeNumber: (json['episode_number'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      overview: json['overview'] as String,
      productionCode: json['production_code'] as String?,
      runtime: (json['runtime'] as num?)?.toInt(),
      seasonNumber: (json['season_number'] as num).toInt(),
      showId: (json['show_id'] as num).toInt(),
      stillPath: json['still_path'] as String?,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: (json['vote_count'] as num).toInt(),
      crew: (json['crew'] as List<dynamic>)
          .map((e) => TvCrewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      guestStars: (json['guest_stars'] as List<dynamic>)
          .map((e) => TvGuestStarModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TvEpisodeModelToJson(TvEpisodeModel instance) =>
    <String, dynamic>{
      'air_date': instance.airDate,
      'episode_number': instance.episodeNumber,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'production_code': instance.productionCode,
      'runtime': instance.runtime,
      'season_number': instance.seasonNumber,
      'show_id': instance.showId,
      'still_path': instance.stillPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'crew': instance.crew,
      'guest_stars': instance.guestStars,
    };

TvCrewModel _$TvCrewModelFromJson(Map<String, dynamic> json) => TvCrewModel(
  job: json['job'] as String,
  department: json['department'] as String,
  creditId: json['credit_id'] as String,
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  originalName: json['original_name'] as String,
  popularity: (json['popularity'] as num).toDouble(),
  profilePath: json['profile_path'] as String?,
);

Map<String, dynamic> _$TvCrewModelToJson(TvCrewModel instance) =>
    <String, dynamic>{
      'job': instance.job,
      'department': instance.department,
      'credit_id': instance.creditId,
      'id': instance.id,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
    };

TvGuestStarModel _$TvGuestStarModelFromJson(Map<String, dynamic> json) =>
    TvGuestStarModel(
      character: json['character'] as String,
      creditId: json['credit_id'] as String,
      order: (json['order'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$TvGuestStarModelToJson(TvGuestStarModel instance) =>
    <String, dynamic>{
      'character': instance.character,
      'credit_id': instance.creditId,
      'order': instance.order,
      'id': instance.id,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
    };
