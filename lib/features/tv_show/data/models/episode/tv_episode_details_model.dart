// ignore_for_file: annotate_overrides, overridden_fields

import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/tv_episode_details_entity.dart';

part 'tv_episode_details_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TvEpisodeDetailsModel extends TvEpisodeDetailsEntity {
  @JsonKey(name: 'air_date')
  final String? airDate;

  final List<CrewMemberModel>? crew;

  @JsonKey(name: 'episode_number')
  final int? episodeNumber;

  @JsonKey(name: 'guest_stars')
  final List<GuestStarModel>? guestStars;

  final String? name;
  final String? overview;
  final int? id;

  @JsonKey(name: 'production_code')
  final String? productionCode;

  final int? runtime;

  @JsonKey(name: 'season_number')
  final int? seasonNumber;

  @JsonKey(name: 'still_path')
  final String? stillPath;

  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @JsonKey(name: 'vote_count')
  final int? voteCount;

  const TvEpisodeDetailsModel({
    this.airDate,
    this.crew,
    this.episodeNumber,
    this.guestStars,
    this.name,
    this.overview,
    this.id,
    this.productionCode,
    this.runtime,
    this.seasonNumber,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
  }) : super(
          airDate: airDate,
          crew: crew,
          episodeNumber: episodeNumber,
          guestStars: guestStars,
          name: name,
          overview: overview,
          id: id,
          productionCode: productionCode,
          runtime: runtime,
          seasonNumber: seasonNumber,
          stillPath: stillPath,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  factory TvEpisodeDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$TvEpisodeDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvEpisodeDetailsModelToJson(this);

    /// ✅ Convert model → entity
  TvEpisodeDetailsEntity toEntity() => TvEpisodeDetailsEntity(
        airDate: airDate,
        crew: crew?.map((c) => c.toEntity()).toList(),
        episodeNumber: episodeNumber,
        guestStars: guestStars?.map((g) => g.toEntity()).toList(),
        name: name,
        overview: overview,
        id: id,
        productionCode: productionCode,
        runtime: runtime,
        seasonNumber: seasonNumber,
        stillPath: stillPath,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );
}

@JsonSerializable()
class CrewMemberModel extends CrewMemberEntity {
  final String? department;
  final String? job;

  @JsonKey(name: 'credit_id')
  final String? creditId;

  final bool? adult;
  final int? gender;
  final int? id;

  @JsonKey(name: 'known_for_department')
  final String? knownForDepartment;

  final String? name;

  @JsonKey(name: 'original_name')
  final String? originalName;

  final double? popularity;

  @JsonKey(name: 'profile_path')
  final String? profilePath;

  const CrewMemberModel({
    this.department,
    this.job,
    this.creditId,
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
  }) : super(
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

  factory CrewMemberModel.fromJson(Map<String, dynamic> json) =>
      _$CrewMemberModelFromJson(json);

  Map<String, dynamic> toJson() => _$CrewMemberModelToJson(this);

    /// ✅ Convert model → entity
  CrewMemberEntity toEntity() => CrewMemberEntity(
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
class GuestStarModel extends GuestStarEntity {
  final String? character;

  @JsonKey(name: 'credit_id')
  final String? creditId;

  final int? order;
  final bool? adult;
  final int? gender;
  final int? id;

  @JsonKey(name: 'known_for_department')
  final String? knownForDepartment;

  final String? name;

  @JsonKey(name: 'original_name')
  final String? originalName;

  final double? popularity;

  @JsonKey(name: 'profile_path')
  final String? profilePath;

  const GuestStarModel({
    this.character,
    this.creditId,
    this.order,
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
  }) : super(
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

  factory GuestStarModel.fromJson(Map<String, dynamic> json) =>
      _$GuestStarModelFromJson(json);

  Map<String, dynamic> toJson() => _$GuestStarModelToJson(this);

    /// ✅ Convert model → entity
  GuestStarEntity toEntity() => GuestStarEntity(
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
