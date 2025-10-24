// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_credits_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvShowCreditsModel _$TvShowCreditsModelFromJson(Map<String, dynamic> json) =>
    TvShowCreditsModel(
      cast: (json['cast'] as List<dynamic>)
          .map((e) => TvCastModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>)
          .map((e) => TvCrewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$TvShowCreditsModelToJson(TvShowCreditsModel instance) =>
    <String, dynamic>{
      'cast': instance.cast.map((e) => e.toJson()).toList(),
      'crew': instance.crew.map((e) => e.toJson()).toList(),
      'id': instance.id,
    };

TvCastModel _$TvCastModelFromJson(Map<String, dynamic> json) => TvCastModel(
  adult: json['adult'] as bool,
  gender: (json['gender'] as num?)?.toInt(),
  id: (json['id'] as num).toInt(),
  knownForDepartment: json['known_for_department'] as String,
  name: json['name'] as String,
  originalName: json['original_name'] as String,
  popularity: (json['popularity'] as num).toDouble(),
  profilePath: json['profile_path'] as String?,
  roles: (json['roles'] as List<dynamic>)
      .map((e) => TvRoleModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalEpisodeCount: (json['total_episode_count'] as num).toInt(),
  order: (json['order'] as num).toInt(),
);

Map<String, dynamic> _$TvCastModelToJson(TvCastModel instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'roles': instance.roles.map((e) => e.toJson()).toList(),
      'total_episode_count': instance.totalEpisodeCount,
      'order': instance.order,
    };

TvRoleModel _$TvRoleModelFromJson(Map<String, dynamic> json) => TvRoleModel(
  creditId: json['credit_id'] as String,
  character: json['character'] as String,
  episodeCount: (json['episode_count'] as num).toInt(),
);

Map<String, dynamic> _$TvRoleModelToJson(TvRoleModel instance) =>
    <String, dynamic>{
      'credit_id': instance.creditId,
      'character': instance.character,
      'episode_count': instance.episodeCount,
    };

TvCrewModel _$TvCrewModelFromJson(Map<String, dynamic> json) => TvCrewModel(
  adult: json['adult'] as bool,
  gender: (json['gender'] as num?)?.toInt(),
  id: (json['id'] as num).toInt(),
  knownForDepartment: json['known_for_department'] as String,
  name: json['name'] as String,
  originalName: json['original_name'] as String,
  popularity: (json['popularity'] as num).toDouble(),
  profilePath: json['profile_path'] as String?,
  jobs: (json['jobs'] as List<dynamic>)
      .map((e) => TvJobModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  department: json['department'] as String,
  totalEpisodeCount: (json['total_episode_count'] as num).toInt(),
);

Map<String, dynamic> _$TvCrewModelToJson(TvCrewModel instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'jobs': instance.jobs.map((e) => e.toJson()).toList(),
      'department': instance.department,
      'total_episode_count': instance.totalEpisodeCount,
    };

TvJobModel _$TvJobModelFromJson(Map<String, dynamic> json) => TvJobModel(
  creditId: json['credit_id'] as String,
  job: json['job'] as String,
  episodeCount: (json['episode_count'] as num).toInt(),
);

Map<String, dynamic> _$TvJobModelToJson(TvJobModel instance) =>
    <String, dynamic>{
      'credit_id': instance.creditId,
      'job': instance.job,
      'episode_count': instance.episodeCount,
    };
