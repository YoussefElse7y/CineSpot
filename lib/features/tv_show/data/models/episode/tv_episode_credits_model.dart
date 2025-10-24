import 'package:cine_spot/features/tv_show/domain/entities/tv_episode_credits_entity.dart';


class TvEpisodeCreditsModel {
  final List<TvEpisodeCastModel> cast;
  final List<TvEpisodeCrewModel> crew;
  final List<TvEpisodeGuestStarModel> guestStars;
  final int id;

  const TvEpisodeCreditsModel({
    required this.cast,
    required this.crew,
    required this.guestStars,
    required this.id,
  });

  factory TvEpisodeCreditsModel.fromJson(Map<String, dynamic> json) {
    return TvEpisodeCreditsModel(
      cast: (json['cast'] as List<dynamic>?)
              ?.map((e) => TvEpisodeCastModel.fromJson(e))
              .toList() ??
          [],
      crew: (json['crew'] as List<dynamic>?)
              ?.map((e) => TvEpisodeCrewModel.fromJson(e))
              .toList() ??
          [],
      guestStars: (json['guest_stars'] as List<dynamic>?)
              ?.map((e) => TvEpisodeGuestStarModel.fromJson(e))
              .toList() ??
          [],
      id: json['id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cast': cast.map((e) => e.toJson()).toList(),
      'crew': crew.map((e) => e.toJson()).toList(),
      'guest_stars': guestStars.map((e) => e.toJson()).toList(),
      'id': id,
    };
  }

  TvEpisodeCreditsEntity toEntity() {
    return TvEpisodeCreditsEntity(
      cast: cast.map((e) => e.toEntity()).toList(),
      crew: crew.map((e) => e.toEntity()).toList(),
      guestStars: guestStars.map((e) => e.toEntity()).toList(),
      id: id,
    );
  }
}

class TvEpisodeCastModel {
  final bool adult;
  final int? gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final String character;
  final String creditId;
  final int order;

  const TvEpisodeCastModel({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    required this.character,
    required this.creditId,
    required this.order,
  });

  factory TvEpisodeCastModel.fromJson(Map<String, dynamic> json) {
    return TvEpisodeCastModel(
      adult: json['adult'] ?? false,
      gender: json['gender'],
      id: json['id'] ?? 0,
      knownForDepartment: json['known_for_department'] ?? '',
      name: json['name'] ?? '',
      originalName: json['original_name'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      profilePath: json['profile_path'],
      character: json['character'] ?? '',
      creditId: json['credit_id'] ?? '',
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
      'character': character,
      'credit_id': creditId,
      'order': order,
    };
  }

  TvEpisodeCastEntity toEntity() {
    return TvEpisodeCastEntity(
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
}

class TvEpisodeCrewModel {
  final String department;
  final String job;
  final String creditId;
  final bool adult;
  final int? gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;

  const TvEpisodeCrewModel({
    required this.department,
    required this.job,
    required this.creditId,
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
  });

  factory TvEpisodeCrewModel.fromJson(Map<String, dynamic> json) {
    return TvEpisodeCrewModel(
      department: json['department'] ?? '',
      job: json['job'] ?? '',
      creditId: json['credit_id'] ?? '',
      adult: json['adult'] ?? false,
      gender: json['gender'],
      id: json['id'] ?? 0,
      knownForDepartment: json['known_for_department'] ?? '',
      name: json['name'] ?? '',
      originalName: json['original_name'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      profilePath: json['profile_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'department': department,
      'job': job,
      'credit_id': creditId,
      'adult': adult,
      'gender': gender,
      'id': id,
      'known_for_department': knownForDepartment,
      'name': name,
      'original_name': originalName,
      'popularity': popularity,
      'profile_path': profilePath,
    };
  }

  TvEpisodeCrewEntity toEntity() {
    return TvEpisodeCrewEntity(
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
}

class TvEpisodeGuestStarModel {
  final String character;
  final String creditId;
  final int order;
  final bool adult;
  final int? gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;

  const TvEpisodeGuestStarModel({
    required this.character,
    required this.creditId,
    required this.order,
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
  });

  factory TvEpisodeGuestStarModel.fromJson(Map<String, dynamic> json) {
    return TvEpisodeGuestStarModel(
      character: json['character'] ?? '',
      creditId: json['credit_id'] ?? '',
      order: json['order'] ?? 0,
      adult: json['adult'] ?? false,
      gender: json['gender'],
      id: json['id'] ?? 0,
      knownForDepartment: json['known_for_department'] ?? '',
      name: json['name'] ?? '',
      originalName: json['original_name'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      profilePath: json['profile_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'character': character,
      'credit_id': creditId,
      'order': order,
      'adult': adult,
      'gender': gender,
      'id': id,
      'known_for_department': knownForDepartment,
      'name': name,
      'original_name': originalName,
      'popularity': popularity,
      'profile_path': profilePath,
    };
  }

  TvEpisodeGuestStarEntity toEntity() {
    return TvEpisodeGuestStarEntity(
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
}
