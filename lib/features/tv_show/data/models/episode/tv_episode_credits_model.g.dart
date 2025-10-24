// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_episode_credits_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvEpisodeCreditsModel _$TvEpisodeCreditsModelFromJson(
  Map<String, dynamic> json,
) => TvEpisodeCreditsModel(
  cast: (json['cast'] as List<dynamic>)
      .map((e) => TvEpisodeCastModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  crew: (json['crew'] as List<dynamic>)
      .map((e) => TvEpisodeCrewModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  guestStars: (json['guestStars'] as List<dynamic>)
      .map((e) => TvEpisodeGuestStarModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  id: (json['id'] as num).toInt(),
);

Map<String, dynamic> _$TvEpisodeCreditsModelToJson(
  TvEpisodeCreditsModel instance,
) => <String, dynamic>{
  'cast': instance.cast,
  'crew': instance.crew,
  'guestStars': instance.guestStars,
  'id': instance.id,
};

TvEpisodeCastModel _$TvEpisodeCastModelFromJson(Map<String, dynamic> json) =>
    TvEpisodeCastModel(
      adult: json['adult'] as bool,
      gender: (json['gender'] as num?)?.toInt(),
      id: (json['id'] as num).toInt(),
      knownForDepartment: json['known_for_department'] as String,
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      profilePath: json['profile_path'] as String?,
      character: json['character'] as String,
      creditId: json['credit_id'] as String,
      order: (json['order'] as num).toInt(),
    );

Map<String, dynamic> _$TvEpisodeCastModelToJson(TvEpisodeCastModel instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'character': instance.character,
      'credit_id': instance.creditId,
      'order': instance.order,
    };

TvEpisodeCrewModel _$TvEpisodeCrewModelFromJson(Map<String, dynamic> json) =>
    TvEpisodeCrewModel(
      department: json['department'] as String,
      job: json['job'] as String,
      creditId: json['credit_id'] as String,
      adult: json['adult'] as bool,
      gender: (json['gender'] as num?)?.toInt(),
      id: (json['id'] as num).toInt(),
      knownForDepartment: json['known_for_department'] as String,
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$TvEpisodeCrewModelToJson(TvEpisodeCrewModel instance) =>
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

TvEpisodeGuestStarModel _$TvEpisodeGuestStarModelFromJson(
  Map<String, dynamic> json,
) => TvEpisodeGuestStarModel(
  character: json['character'] as String,
  creditId: json['credit_id'] as String,
  order: (json['order'] as num).toInt(),
  adult: json['adult'] as bool,
  gender: (json['gender'] as num?)?.toInt(),
  id: (json['id'] as num).toInt(),
  knownForDepartment: json['known_for_department'] as String,
  name: json['name'] as String,
  originalName: json['original_name'] as String,
  popularity: (json['popularity'] as num).toDouble(),
  profilePath: json['profile_path'] as String?,
);

Map<String, dynamic> _$TvEpisodeGuestStarModelToJson(
  TvEpisodeGuestStarModel instance,
) => <String, dynamic>{
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
