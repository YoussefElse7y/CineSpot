// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_season_credits_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvSeasonCreditsModel _$TvSeasonCreditsModelFromJson(
  Map<String, dynamic> json,
) => TvSeasonCreditsModel(
  cast: (json['cast'] as List<dynamic>)
      .map((e) => TvSeasonCastModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  crew: (json['crew'] as List<dynamic>)
      .map((e) => TvSeasonCrewModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  id: (json['id'] as num).toInt(),
);

Map<String, dynamic> _$TvSeasonCreditsModelToJson(
  TvSeasonCreditsModel instance,
) => <String, dynamic>{
  'cast': instance.cast,
  'crew': instance.crew,
  'id': instance.id,
};

TvSeasonCastModel _$TvSeasonCastModelFromJson(Map<String, dynamic> json) =>
    TvSeasonCastModel(
      adult: json['adult'] as bool,
      gender: (json['gender'] as num).toInt(),
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

Map<String, dynamic> _$TvSeasonCastModelToJson(TvSeasonCastModel instance) =>
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

TvSeasonCrewModel _$TvSeasonCrewModelFromJson(Map<String, dynamic> json) =>
    TvSeasonCrewModel(
      adult: json['adult'] as bool,
      gender: (json['gender'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      knownForDepartment: json['known_for_department'] as String,
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      profilePath: json['profile_path'] as String?,
      creditId: json['credit_id'] as String,
      department: json['department'] as String,
      job: json['job'] as String,
    );

Map<String, dynamic> _$TvSeasonCrewModelToJson(TvSeasonCrewModel instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'credit_id': instance.creditId,
      'department': instance.department,
      'job': instance.job,
    };
