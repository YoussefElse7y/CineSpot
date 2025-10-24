import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/tv_show_credits_entity.dart';

part 'tv_show_credits_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TvShowCreditsModel {
  final List<TvCastModel> cast;
  final List<TvCrewModel> crew;
  final int id;

  TvShowCreditsModel({
    required this.cast,
    required this.crew,
    required this.id,
  });

  factory TvShowCreditsModel.fromJson(Map<String, dynamic> json) =>
      _$TvShowCreditsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowCreditsModelToJson(this);

  TvShowCreditsEntity toEntity() => TvShowCreditsEntity(
        id: id,
        cast: cast.map((e) => e.toEntity()).toList(),
        crew: crew.map((e) => e.toEntity()).toList(),
      );
}

@JsonSerializable(explicitToJson: true)
class TvCastModel {
  final bool adult;
  final int? gender;
  final int id;
  @JsonKey(name: 'known_for_department')
  final String knownForDepartment;
  final String name;
  @JsonKey(name: 'original_name')
  final String originalName;
  final double popularity;
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  final List<TvRoleModel> roles;
  @JsonKey(name: 'total_episode_count')
  final int totalEpisodeCount;
  final int order;

  TvCastModel({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    required this.roles,
    required this.totalEpisodeCount,
    required this.order,
  });

  factory TvCastModel.fromJson(Map<String, dynamic> json) =>
      _$TvCastModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvCastModelToJson(this);

  TvCastEntity toEntity() => TvCastEntity(
        adult: adult,
        gender: gender,
        id: id,
        knownForDepartment: knownForDepartment,
        name: name,
        originalName: originalName,
        popularity: popularity,
        profilePath: profilePath,
        roles: roles.map((e) => e.toEntity()).toList(),
        totalEpisodeCount: totalEpisodeCount,
        order: order,
      );
}

@JsonSerializable()
class TvRoleModel {
  @JsonKey(name: 'credit_id')
  final String creditId;
  final String character;
  @JsonKey(name: 'episode_count')
  final int episodeCount;

  TvRoleModel({
    required this.creditId,
    required this.character,
    required this.episodeCount,
  });

  factory TvRoleModel.fromJson(Map<String, dynamic> json) =>
      _$TvRoleModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvRoleModelToJson(this);

  TvRoleEntity toEntity() => TvRoleEntity(
        creditId: creditId,
        character: character,
        episodeCount: episodeCount,
      );
}

@JsonSerializable(explicitToJson: true)
class TvCrewModel {
  final bool adult;
  final int? gender;
  final int id;
  @JsonKey(name: 'known_for_department')
  final String knownForDepartment;
  final String name;
  @JsonKey(name: 'original_name')
  final String originalName;
  final double popularity;
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  final List<TvJobModel> jobs;
  final String department;
  @JsonKey(name: 'total_episode_count')
  final int totalEpisodeCount;

  TvCrewModel({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    required this.jobs,
    required this.department,
    required this.totalEpisodeCount,
  });

  factory TvCrewModel.fromJson(Map<String, dynamic> json) =>
      _$TvCrewModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvCrewModelToJson(this);

  TvCrewEntity toEntity() => TvCrewEntity(
        adult: adult,
        gender: gender,
        id: id,
        knownForDepartment: knownForDepartment,
        name: name,
        originalName: originalName,
        popularity: popularity,
        profilePath: profilePath,
        jobs: jobs.map((e) => e.toEntity()).toList(),
        department: department,
        totalEpisodeCount: totalEpisodeCount,
      );
}

@JsonSerializable()
class TvJobModel {
  @JsonKey(name: 'credit_id')
  final String creditId;
  final String job;
  @JsonKey(name: 'episode_count')
  final int episodeCount;

  TvJobModel({
    required this.creditId,
    required this.job,
    required this.episodeCount,
  });

  factory TvJobModel.fromJson(Map<String, dynamic> json) =>
      _$TvJobModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvJobModelToJson(this);

  TvJobEntity toEntity() => TvJobEntity(
        creditId: creditId,
        job: job,
        episodeCount: episodeCount,
      );
}
