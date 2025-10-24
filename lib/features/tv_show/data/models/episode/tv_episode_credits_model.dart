// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/tv_episode_credits_entity.dart';

part 'tv_episode_credits_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TvEpisodeCreditsModel extends TvEpisodeCreditsEntity {
  const TvEpisodeCreditsModel({
    required List<TvEpisodeCastModel> super.cast,
    required List<TvEpisodeCrewModel> super.crew,
    required List<TvEpisodeGuestStarModel> super.guestStars,
    required super.id,
  });

  factory TvEpisodeCreditsModel.fromJson(Map<String, dynamic> json) =>
      _$TvEpisodeCreditsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvEpisodeCreditsModelToJson(this);

  TvEpisodeCreditsEntity toEntity() => TvEpisodeCreditsEntity(
        cast: cast.map((e) => e.toEntity()).toList(),
        crew: crew.map((e) => e.toEntity()).toList(),
        guestStars: guestStars.map((e) => e.toEntity()).toList(),
        id: id,
      );
}

@JsonSerializable()
class TvEpisodeCastModel extends TvEpisodeCastEntity {
  const TvEpisodeCastModel({
    required super.adult,
    super.gender,
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

  factory TvEpisodeCastModel.fromJson(Map<String, dynamic> json) =>
      _$TvEpisodeCastModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvEpisodeCastModelToJson(this);

  TvEpisodeCastEntity toEntity() => TvEpisodeCastEntity(
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
class TvEpisodeCrewModel extends TvEpisodeCrewEntity {
  const TvEpisodeCrewModel({
    required super.department,
    required super.job,
    @JsonKey(name: 'credit_id') required super.creditId,
    required super.adult,
    super.gender,
    required super.id,
    @JsonKey(name: 'known_for_department') required super.knownForDepartment,
    required super.name,
    @JsonKey(name: 'original_name') required super.originalName,
    required super.popularity,
    @JsonKey(name: 'profile_path') super.profilePath,
  });

  factory TvEpisodeCrewModel.fromJson(Map<String, dynamic> json) =>
      _$TvEpisodeCrewModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvEpisodeCrewModelToJson(this);

  TvEpisodeCrewEntity toEntity() => TvEpisodeCrewEntity(
        department: department,
        job: job,
        creditId: creditId,
        adult: adult,
        gender: gender,
        id: id,
        knownForDepartment: knownForDepartment,
        name: name,
        originalName: originalName,
        popularity: popularity,
        profilePath: profilePath,
      );
}

@JsonSerializable()
class TvEpisodeGuestStarModel extends TvEpisodeGuestStarEntity {
  const TvEpisodeGuestStarModel({
    required super.character,
    @JsonKey(name: 'credit_id') required super.creditId,
    required super.order,
    required super.adult,
    super.gender,
    required super.id,
    @JsonKey(name: 'known_for_department') required super.knownForDepartment,
    required super.name,
    @JsonKey(name: 'original_name') required super.originalName,
    required super.popularity,
    @JsonKey(name: 'profile_path') super.profilePath,
  });

  factory TvEpisodeGuestStarModel.fromJson(Map<String, dynamic> json) =>
      _$TvEpisodeGuestStarModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvEpisodeGuestStarModelToJson(this);

  TvEpisodeGuestStarEntity toEntity() => TvEpisodeGuestStarEntity(
        character: character,
        creditId: creditId,
        order: order,
        adult: adult,
        gender: gender,
        id: id,
        knownForDepartment: knownForDepartment,
        name: name,
        originalName: originalName,
        popularity: popularity,
        profilePath: profilePath,
      );
}
