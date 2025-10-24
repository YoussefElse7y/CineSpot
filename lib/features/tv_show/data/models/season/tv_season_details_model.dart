// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/tv_season_details_entity.dart';

part 'tv_season_details_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TvSeasonDetailsModel extends TvSeasonDetailsEntity {
   TvSeasonDetailsModel({
    @JsonKey(name: 'air_date') super.airDate,
    @JsonKey(name: 'episodes') required List<TvEpisodeModel> super.episodes,
    required super.name,
    required super.overview,
    required super.id,
    @JsonKey(name: 'poster_path') super.posterPath,
    @JsonKey(name: 'season_number') required super.seasonNumber,   
  });

  factory TvSeasonDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$TvSeasonDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvSeasonDetailsModelToJson(this);

  /// ✅ Convert model to entity
  TvSeasonDetailsEntity toEntity() => TvSeasonDetailsEntity(
        airDate: airDate,
        episodes: episodes.map((e) => e.toEntity()).toList(),
        name: name,
        overview: overview,
        id: id,
        posterPath: posterPath,
        seasonNumber: seasonNumber,
      );
}

@JsonSerializable(explicitToJson: true)
class TvEpisodeModel extends TvEpisodeEntity {
   TvEpisodeModel({
    @JsonKey(name: 'air_date') super.airDate,
    @JsonKey(name: 'episode_number') required super.episodeNumber,
    required super.id,
    required super.name,
    required super.overview,
    @JsonKey(name: 'production_code') super.productionCode,
    super.runtime,
    @JsonKey(name: 'season_number') required super.seasonNumber,
    @JsonKey(name: 'show_id') required super.showId,
    @JsonKey(name: 'still_path') super.stillPath,
    @JsonKey(name: 'vote_average') required super.voteAverage,
    @JsonKey(name: 'vote_count') required super.voteCount,
    required List<TvCrewModel> super.crew,
    @JsonKey(name: 'guest_stars') required List<TvGuestStarModel> super.guestStars,
  });

  factory TvEpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$TvEpisodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvEpisodeModelToJson(this);

  /// ✅ Convert model to entity
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
        crew: crew.map((c) => c.toEntity()).toList(),
        guestStars: guestStars.map((g) => g.toEntity()).toList(),
      );
}

@JsonSerializable()
class TvCrewModel extends TvCrewEntity {
   TvCrewModel({
    required super.job,
    required super.department,
    @JsonKey(name: 'credit_id') required super.creditId,
    required super.id,
    required super.name,
    @JsonKey(name: 'original_name') required super.originalName,
    required super.popularity,
    @JsonKey(name: 'profile_path') super.profilePath,
  });

  factory TvCrewModel.fromJson(Map<String, dynamic> json) =>
      _$TvCrewModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvCrewModelToJson(this);

  /// ✅ Convert model to entity
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

@JsonSerializable()
class TvGuestStarModel extends TvGuestStarEntity {
   TvGuestStarModel({
    required super.character,
    @JsonKey(name: 'credit_id') required super.creditId,
    required super.order,
    required super.id,
    required super.name,
    @JsonKey(name: 'original_name') required super.originalName,
    required super.popularity,
    @JsonKey(name: 'profile_path') super.profilePath,
  });

  factory TvGuestStarModel.fromJson(Map<String, dynamic> json) =>
      _$TvGuestStarModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvGuestStarModelToJson(this);

  /// ✅ Convert model to entity
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
