// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/tv_season_credits_entity.dart';

part 'tv_season_credits_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TvSeasonCreditsModel extends TvSeasonCreditsEntity {
  const TvSeasonCreditsModel({
    @JsonKey(name: 'cast') required List<TvSeasonCastModel> super.cast,
    @JsonKey(name: 'crew') required List<TvSeasonCrewModel> super.crew,
    required super.id,
  });

  factory TvSeasonCreditsModel.fromJson(Map<String, dynamic> json) =>
      _$TvSeasonCreditsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvSeasonCreditsModelToJson(this);

  /// ✅ Convert model → entity
  TvSeasonCreditsEntity toEntity() => TvSeasonCreditsEntity(
        cast: cast.map((c) => c.toEntity()).toList(),
        crew: crew.map((c) => c.toEntity()).toList(),
        id: id,
      );
}

@JsonSerializable()
class TvSeasonCastModel extends TvSeasonCastEntity {
  const TvSeasonCastModel({
    required super.adult,
    required super.gender,
    required super.id,
    @JsonKey(name: 'known_for_department') required super.knownForDepartment,
    required super.name,
    @JsonKey(name: 'original_name') required super.originalName,
    required super.popularity,
    @JsonKey(name: 'profile_path') super.profilePath,
    required super.character,
    @JsonKey(name: 'credit_id') required super.creditId,
    required super.order,
  });

  factory TvSeasonCastModel.fromJson(Map<String, dynamic> json) =>
      _$TvSeasonCastModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvSeasonCastModelToJson(this);

  /// ✅ Convert model → entity
  TvSeasonCastEntity toEntity() => TvSeasonCastEntity(
        adult: adult,
        gender: gender,
        id: id,
        knownForDepartment: knownForDepartment,
        name: name,
        originalName: originalName,
        popularity: popularity,
        profilePath: profilePath,
        character: character,
        creditId: creditId,
        order: order,
      );
}

@JsonSerializable()
class TvSeasonCrewModel extends TvSeasonCrewEntity {
  const TvSeasonCrewModel({
    required super.adult,
    required super.gender,
    required super.id,
    @JsonKey(name: 'known_for_department') required super.knownForDepartment,
    required super.name,
    @JsonKey(name: 'original_name') required super.originalName,
    required super.popularity,
    @JsonKey(name: 'profile_path') super.profilePath,
    @JsonKey(name: 'credit_id') required super.creditId,
    required super.department,
    required super.job,
  });

  factory TvSeasonCrewModel.fromJson(Map<String, dynamic> json) =>
      _$TvSeasonCrewModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvSeasonCrewModelToJson(this);

  /// ✅ Convert model → entity
  TvSeasonCrewEntity toEntity() => TvSeasonCrewEntity(
        adult: adult,
        gender: gender,
        id: id,
        knownForDepartment: knownForDepartment,
        name: name,
        originalName: originalName,
        popularity: popularity,
        profilePath: profilePath,
        creditId: creditId,
        department: department,
        job: job,
      );
}
