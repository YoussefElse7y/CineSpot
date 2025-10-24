// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_episode_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvEpisodeDetailsModel _$TvEpisodeDetailsModelFromJson(
  Map<String, dynamic> json,
) => TvEpisodeDetailsModel(
  airDate: json['air_date'] as String?,
  crew: (json['crew'] as List<dynamic>?)
      ?.map((e) => CrewMemberModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  episodeNumber: (json['episode_number'] as num?)?.toInt(),
  guestStars: (json['guest_stars'] as List<dynamic>?)
      ?.map((e) => GuestStarModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  overview: json['overview'] as String?,
  id: (json['id'] as num?)?.toInt(),
  productionCode: json['production_code'] as String?,
  runtime: (json['runtime'] as num?)?.toInt(),
  seasonNumber: (json['season_number'] as num?)?.toInt(),
  stillPath: json['still_path'] as String?,
  voteAverage: (json['vote_average'] as num?)?.toDouble(),
  voteCount: (json['vote_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$TvEpisodeDetailsModelToJson(
  TvEpisodeDetailsModel instance,
) => <String, dynamic>{
  'air_date': instance.airDate,
  'crew': instance.crew?.map((e) => e.toJson()).toList(),
  'episode_number': instance.episodeNumber,
  'guest_stars': instance.guestStars?.map((e) => e.toJson()).toList(),
  'name': instance.name,
  'overview': instance.overview,
  'id': instance.id,
  'production_code': instance.productionCode,
  'runtime': instance.runtime,
  'season_number': instance.seasonNumber,
  'still_path': instance.stillPath,
  'vote_average': instance.voteAverage,
  'vote_count': instance.voteCount,
};

CrewMemberModel _$CrewMemberModelFromJson(Map<String, dynamic> json) =>
    CrewMemberModel(
      department: json['department'] as String?,
      job: json['job'] as String?,
      creditId: json['credit_id'] as String?,
      adult: json['adult'] as bool?,
      gender: (json['gender'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      knownForDepartment: json['known_for_department'] as String?,
      name: json['name'] as String?,
      originalName: json['original_name'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$CrewMemberModelToJson(CrewMemberModel instance) =>
    <String, dynamic>{
      'department': instance.department,
      'job': instance.job,
      'credit_id': instance.creditId,
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
    };

GuestStarModel _$GuestStarModelFromJson(Map<String, dynamic> json) =>
    GuestStarModel(
      character: json['character'] as String?,
      creditId: json['credit_id'] as String?,
      order: (json['order'] as num?)?.toInt(),
      adult: json['adult'] as bool?,
      gender: (json['gender'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      knownForDepartment: json['known_for_department'] as String?,
      name: json['name'] as String?,
      originalName: json['original_name'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$GuestStarModelToJson(GuestStarModel instance) =>
    <String, dynamic>{
      'character': instance.character,
      'credit_id': instance.creditId,
      'order': instance.order,
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
    };
