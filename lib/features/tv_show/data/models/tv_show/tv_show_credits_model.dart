// tv_show_credits_model.dart

import 'package:cine_spot/features/tv_show/domain/entities/tv_show_credits_entity.dart';


class TvShowCreditsModel extends TvShowCreditsEntity {
  TvShowCreditsModel({
    required List<TvCastModel> super.cast,
    required List<TvCrewModel> super.crew,
    required super.id,
  });

  factory TvShowCreditsModel.fromJson(Map<String, dynamic> json) {
    return TvShowCreditsModel(
      cast: (json['cast'] as List<dynamic>? ?? [])
          .map((e) => TvCastModel.fromJson(e))
          .toList(),
      crew: (json['crew'] as List<dynamic>? ?? [])
          .map((e) => TvCrewModel.fromJson(e))
          .toList(),
      id: json['id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cast': cast.map((e) => (e as TvCastModel).toJson()).toList(),
      'crew': crew.map((e) => (e as TvCrewModel).toJson()).toList(),
      'id': id,
    };
  }

  TvShowCreditsEntity toEntity() {
    return TvShowCreditsEntity(
      cast: cast.map((e) =>( e as TvCastModel).toEntity()).toList(),
      crew: crew.map((e) => (e as TvCrewModel).toEntity()).toList(),
      id: id,
    );
  }
}

class TvCastModel extends TvCastEntity {
  TvCastModel({
    required super.adult,
    super.gender,
    required super.id,
    required super.knownForDepartment,
    required super.name,
    required super.originalName,
    required super.popularity,
    super.profilePath,
    required List<TvRoleModel> super.roles,
    required super.totalEpisodeCount,
    required super.order,
  });

  factory TvCastModel.fromJson(Map<String, dynamic> json) {
    return TvCastModel(
      adult: json['adult'] ?? false,
      gender: json['gender'],
      id: json['id'] ?? 0,
      knownForDepartment: json['known_for_department'] ?? '',
      name: json['name'] ?? '',
      originalName: json['original_name'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      profilePath: json['profile_path'],
      roles: (json['roles'] as List<dynamic>? ?? [])
          .map((e) => TvRoleModel.fromJson(e))
          .toList(),
      totalEpisodeCount: json['total_episode_count'] ?? 0,
      order: json['order'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'gender': gender,
      'id': id,
      'known_for_department': knownForDepartment,
      'name': name,
      'original_name': originalName,
      'popularity': popularity,
      'profile_path': profilePath,
      'roles': roles.map((e) => (e as TvRoleModel).toJson()).toList(),
      'total_episode_count': totalEpisodeCount,
      'order': order,
    };
  }

  TvCastEntity toEntity() {
    return TvCastEntity(
      adult: adult,
      gender: gender,
      id: id,
      knownForDepartment: knownForDepartment,
      name: name,
      originalName: originalName,
      popularity: popularity,
      profilePath: profilePath,
      roles: roles.map((e) => (e as TvRoleModel).toEntity()).toList(),
      totalEpisodeCount: totalEpisodeCount,
      order: order,
    );
  }
}

class TvRoleModel extends TvRoleEntity {
  TvRoleModel({
    required super.creditId,
    required super.character,
    required super.episodeCount,
  });

  factory TvRoleModel.fromJson(Map<String, dynamic> json) {
    return TvRoleModel(
      creditId: json['credit_id'] ?? '',
      character: json['character'] ?? '',
      episodeCount: json['episode_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'credit_id': creditId,
      'character': character,
      'episode_count': episodeCount,
    };
  }

  TvRoleEntity toEntity() {
    return TvRoleEntity(
      creditId: creditId,
      character: character,
      episodeCount: episodeCount,
    );
  }
}

class TvCrewModel extends TvCrewEntity {
  TvCrewModel({
    required super.adult,
    super.gender,
    required super.id,
    required super.knownForDepartment,
    required super.name,
    required super.originalName,
    required super.popularity,
    super.profilePath,
    required List<TvJobModel> super.jobs,
    required super.department,
    required super.totalEpisodeCount,
  });

  factory TvCrewModel.fromJson(Map<String, dynamic> json) {
    return TvCrewModel(
      adult: json['adult'] ?? false,
      gender: json['gender'],
      id: json['id'] ?? 0,
      knownForDepartment: json['known_for_department'] ?? '',
      name: json['name'] ?? '',
      originalName: json['original_name'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      profilePath: json['profile_path'],
      jobs: (json['jobs'] as List<dynamic>? ?? [])
          .map((e) => TvJobModel.fromJson(e))
          .toList(),
      department: json['department'] ?? '',
      totalEpisodeCount: json['total_episode_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'gender': gender,
      'id': id,
      'known_for_department': knownForDepartment,
      'name': name,
      'original_name': originalName,
      'popularity': popularity,
      'profile_path': profilePath,
      'jobs': jobs.map((e) => (e as TvJobModel).toJson()).toList(),
      'department': department,
      'total_episode_count': totalEpisodeCount,
    };
  }

  TvCrewEntity toEntity() {
    return TvCrewEntity(
      adult: adult,
      gender: gender,
      id: id,
      knownForDepartment: knownForDepartment,
      name: name,
      originalName: originalName,
      popularity: popularity,
      profilePath: profilePath,
      jobs: jobs.map((e) => (e as TvJobModel).toEntity()).toList(),
      department: department,
      totalEpisodeCount: totalEpisodeCount,
    );
  }
}

class TvJobModel extends TvJobEntity {
  TvJobModel({
    required super.creditId,
    required super.job,
    required super.episodeCount,
  });

  factory TvJobModel.fromJson(Map<String, dynamic> json) {
    return TvJobModel(
      creditId: json['credit_id'] ?? '',
      job: json['job'] ?? '',
      episodeCount: json['episode_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'credit_id': creditId,
      'job': job,
      'episode_count': episodeCount,
    };
  }

  TvJobEntity toEntity() {
    return TvJobEntity(
      creditId: creditId,
      job: job,
      episodeCount: episodeCount,
    );
  }
}
